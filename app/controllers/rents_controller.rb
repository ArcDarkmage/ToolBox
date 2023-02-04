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
    authorize @rent
    if @rent.save
      # por enquanto está indo para a página inicial. Alterar depois.
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
