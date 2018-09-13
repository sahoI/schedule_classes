class UserController < ApplicationController
  def new

  end

  def show
    @user = User.find(id: 1)
  end

  def create
    # @user = User.new(post_params)
    render plain: params[:user].inspect
    # @user.save
    #   flash[:notice] = "登録しました"
    # redirect_to("/user/show")
    # else
    #   flash[:notice] = "登録できませんでした"
    #   render("/registration/mon")
    # end
  end
  def post_params
    params.require(:user).permit(:name)
  end
end
