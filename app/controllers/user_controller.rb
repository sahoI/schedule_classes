class UserController < ApplicationController
  def index
    @user = User.find_by(id: params[:id])
  end
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
      redirect_to("/registration/index")
    else
      # flash[:notice] = "登録できませんでした"
      render("/user/new")
    end
  end
  def post_params
    params.require(:user).permit(:name, :email, :department, :grade, :friend_id)
  end
  def login_form
  end
  def login
    # render plain: params[:user].inspect
    @user = User.find_by(name: params[:name], email: params[:email])
    if @user
      redirect_to("/user/#{@user.id}")
    else
      @name = params[:name]
      @email = params[:email]
      render("/user/new")
    end
  end
  def search
    #ViewのFormで取得したパラメータをモデルに渡す
    @friendIds = User.search(params[:friend_id])
  end
end
