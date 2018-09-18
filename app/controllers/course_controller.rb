class CourseController < ApplicationController
  def choice
    @time_schedules = Classlist.all
  end
  def create
    @course = Course.new(post_params)
    @course.save
    redirect_to('/registration/index')
  end

  def confirm
    p post_params
  end
  private
  def post_params
    params.require(:course).permit(:class_id, :user_id)
  end
end
