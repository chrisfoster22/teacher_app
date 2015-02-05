class TeachersController < ApplicationController

  def new
  @teacher = Teacher.new
end

def create
  @teacher = Teacher.new(teacher_params)
  if @teacher.save
    log_in @teacher
    flash[:success] = "Welcome to the Sample App!"
    redirect_to @teacher, notice: 'teacher was successfully created.'
  else
    render :new
  end
end

def show
  @teacher = Teacher.find(params[:id])
end

def edit
  @teachers = Teacher.all
end

def update
  if @teacher.update(teacher_params)
    redirect_to @teacher, notice: 'teacher was successfully updated.'
  else
    render :edit
  end
end

def index
  # @entree_teachers = teacher.all.where(category_id: 1)
  # @app_teachers = teacher.all.where(category_id: 2)
  # @special_teachers = teacher.all.where(category_id: 3)
  @categories = Category.all
  @meals = Meal.all
end

def destroy
  @teacher = Teacher.find(params[:id])
  @teacher.destroy
  respond_to do |format|
    format.html { redirect_to sessions_new_path, notice: 'teacher was successfully destroyed.' }
  end
end

private
def set_teacher
  @teacher = Teacher.find(params[:id])
end
#
# def set_meal
#   session[:teacher] = teacher.find(params[:id]).name
# end
# #
# def categories
#   @categories = Category.all
# end

def teacher_params
  params.require(:teacher).permit(:name, :email, :password)
end

end
