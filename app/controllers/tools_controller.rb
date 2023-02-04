class ToolsController < ApplicationController
  def index
    @tools = policy_scope(Tool)

    if params[:query].present?
      @tools = Tool.search_by_name_and_details(params[:query])
    end

  end

  def show
    @tool = Tool.find(params[:id])
    authorize @tool
  end

  def new
    @tool = Tool.new
    authorize @tool
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    @tool.price_cents = params[:tool][:price_cents].to_i * 100
    authorize @tool
    if @tool.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tool = Tool.find(params[:id])
    @tool.price_cents.to_i / 100
    authorize @tool
  end

  def update
    @tool = Tool.find(params[:id])
    @tool.update(tool_params)
    redirect_to tool_path(@tool)
    authorize @tool
  end

  def destroy
    @tool = Tool.find(params[:id])
    authorize @tool
    @tool.destroy
    # redirecionando para home, editar depois
    redirect_to root_path, status: :see_other
  end

  # def search
  # end

  private

  def tool_params
    params.require(:tool).permit(:name, :details, :price_cents)
  end
end
