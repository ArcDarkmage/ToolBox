class RentsController < ApplicationController
  def create
    @rent = Rent.new(rent_params)
    @tool = Tool.find(params[:tool_id])
    @rent.user = current_user
    @rent.tool = @tool
    days = (@rent.date_end - @rent.date_start).to_i
    @rent.total_cents = @tool.price_cents * (days + 1)
    authorize @rent
    if @rent.save
      redirect_to profile_path(current_user), notice: "Ferramenta alugada com sucesso."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @rent = Rent.find(params[:id])
    authorize @rent
  end

  def edit
    @rent = Rent.find(params[:id])
    @tool = @rent.tool
    authorize @rent
  end

  def update
    @rent = Rent.find(params[:id])
    @tool = @rent.tool
    days = (@rent.date_end - @rent.date_start).to_i
    @rent.total_cents = @tool.price_cents * (days + 1)
    authorize @rent
    if @rent.update(rent_params)
      redirect_to rent_path(@rent)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @rent = Rent.find(params[:id])
    authorize @rent
    if @rent.date_start <= Date.today
      redirect_to profile_path(@rent.user), alert: "Aluguel em progresso. Não pode ser cancelado!"
    else
      @rent.destroy
      redirect_to profile_path(@rent.user), notice: "Aluguel cancelado com sucesso"
    end
  end

  private

  def rent_params
    params.require(:rent).permit(:date_start, :date_end)
  end
end
