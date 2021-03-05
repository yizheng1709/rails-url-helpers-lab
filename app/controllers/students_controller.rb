require 'pry'
class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def activate
    @student = Student.find_by(id: params[:id]) 
    @student.toggle(:active)
    @student.save
    redirect_to student_path(@student)
  end

  def show
    # binding.pry
    @student = Student.find_by(id: params[:id])
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end