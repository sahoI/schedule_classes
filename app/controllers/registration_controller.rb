class RegistrationController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
    @courses = Course.all
    @courses_count = Course.count
    # @mon = Monday.new
    # @thes = Thesday.new
    # @wednes = Wednesday.new
    # @thurs = Thursday.new
    # @fri = Friday.new
    # time = ["first", "second", "third", "fourth", "fifth"]
    #
    #
    # @courses_count.times do |c|
    #   @classlist = Classlist.find_by(id: @courses[c].class_id)
    #   d = @classlist.day_of_the_week[0]
    #   t = @classlist.time_schedule
    #   5.times do |a|
    #     if d == "月" || t == a
    #       @mon.time[a] = @classlist
    #     elsif d == "火" || t == a
    #       @thes.time[a] = @classlist
    #     elsif d == "水" || t == a
    #       @wednes.time[a] = @classlist
    #     elsif d == "木" || t == a
    #       @thurs.time[a] = @classlist
    #     elsif d == "金" || t == a
    #       @fri.time[a] = @classlist
    #     end
    #   end
    # end
  end

  def create
    @class = Register.new(post_params)
    if @class.save
      flash[:notice] = "登録しました"
      redirect_to("/registration/index")
    else
      flash[:notice] = "登録できませんでした"
      render("/registration/mon")
    end
  end

  def post_params
    params.require(:registrate).permit(:name)
  end

end

