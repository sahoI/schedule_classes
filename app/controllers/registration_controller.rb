class RegistrationController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @time_schedules = Classlist.all
  end

  def create
    @class = Course.new(user_id: 1, class_id: params[:class_id], day_of_the_week: params[:day_of_the_week], time_schedule: params[:time_schedule])
    if @class.class_id != nil
      if @class.save
        flash[:notice] = "登録しました"
        redirect_to("/registration/index")
      else
        flash[:notice] = "登録できませんでした"
        render("/classlist/show")
      end
    end
  end

  def post_params
    params.require(:course).permit(:class_id, :day_of_the_week, :time_schedule)
  end
end
