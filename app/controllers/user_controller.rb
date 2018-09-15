class UserController < ApplicationController
  def new
    @user = User.new
  end

  def show
    @users = User.all
  end

  def create
    @user = User.new(post_params)
    # render plain: params[:user].inspect
    if @user.save
      # flash[:notice] = "登録しました"
      redirect_to("/user/show")
    else
      # flash[:notice] = "登録できませんでした"
      render("/user/new")
    end
  end
  def post_params
    params.require(:user).permit(:name, :email, :department, :grade, :friend_id)
  end
  def login

  end
end
