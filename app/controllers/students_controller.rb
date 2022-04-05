class StudentsController < ApplicationController
  def index
    @students = Student.all
  end
  def show
    @student = Student.find(params[:id])
  end
  def new
    @student = Student.new
  end
  def create
    @student = Student.new(student_params)
    puts "new_student_params start"
    p student_params
    puts "new_student_params end"
    if @student.save
      redirect_to @student
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    temp_db = Student.find(params[:id])
    p "temp_db"
    p temp_db
    languages = temp_db[:languages_known]
    p "languages"
    p languages
    p JSON.parse languages
    languages = JSON.parse languages
    p Hash[languages.collect { |item| [item, item] } ]
    hashed = Hash[languages.collect { |item| [item, item] } ]
    temp_db[:languages_known] = languages
    p temp_db
    @student = temp_db
  end

  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)
      redirect_to @student
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to root_path, status: :see_other
  end

  private

  def student_params
    p "ak student"
    p :student
    # params.require(:student).permit(:name, :email, :mobile_no)
    # Remove the empty string values inside array and store
    if params[:student] && params[:student][:languages_known]
      languages_selected_arr = params[:student][:languages_known]
      params[:student][:languages_known] = languages_selected_arr.reject { |v| v.empty? }
    end
    # To permit all params
    params.require(:student).permit!
  end

  # def new_student_params
  #   # params.require(:student).permit(:name, :email, :mobile_no)
  #   # To permit all params
  #   languages_selected_arr = params[:student][:languages_known]
  #   # Remove the empty string values inside array and store
  #   params[:student][:languages_known] = languages_selected_arr.reject { |v| v.empty? }
  #   params.require(:student).permit!
  # end
  # def update_student_params
  #   p "update student"
  #   p :student
  #   # params.require(:student).permit(:name, :email, :mobile_no)
  #   # To permit all params
  #   params.require(:student).permit!
  # end
end
