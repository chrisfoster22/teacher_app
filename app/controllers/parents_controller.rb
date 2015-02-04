class ParentsController < ApplicationController
  def new
    @parent = parent.new
  end

  def create
    @parent = parent.new(parent_params)
    if @parent.save
      redirect_to parents_path, notice: 'parent was successfully created.'
    else
      render :new
    end
  end

  def show
    redirect_to parents_path
  end

  def edit
    @categories = Category.all
    @parents = parent.all
  end

  def update
    if @parent.update(parent_params)
      redirect_to @parent, notice: 'parent was successfully updated.'
    else
      render :edit
    end
  end

  def index
    @parents = Parent.all
  end

  def destroy
    @parent = parent.find(params[:id])
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_path, notice: 'parent was successfully destroyed.' }
    end
  end

  private
  def set_parent
    @parent = parent.find(params[:id])
  end

  # def set_meal
  #   session[:parent] = parent.find(params[:id]).name
  # end
  #
  # def categories
  #   @categories = Category.all
  # end

  def parent_params
    params.require(:parent).permit(:name, :price, :category_id, :meal_id)
  end
end
