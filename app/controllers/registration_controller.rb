class RegistrationController < ApplicationController
  def index
    @class = Register.find_by(id:1)
  end

  def create
    @class = Register.new(post_params)
    # render plain: params[:registrate].inspect
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
