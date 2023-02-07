class RentsController < ApplicationController
  def new
    @rent = Rent.new
    @tool = Tool.find(params[:tool_id])
    authorize @rent
  end

  def create
    @rent = Rent.new(rent_params)
    @tool = Tool.find(params[:tool_id])
    @rent.user = current_user
    @rent.tool = @tool
    days = (@rent.date_end - @rent.date_start).to_i
    @rent.total_cents = @tool.price_cents * (days + 1)
    authorize @rent
    if @rent.save
      redirect_to profile_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:date_start, :date_end)
  end
end
