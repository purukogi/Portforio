class PboxesController < ApplicationController
  def index
    @user = User.find_by(params[:user_id])
    @pboxes = Pbox.all
  end
  
  def new
    @user = User.find(params[:id])
    @pbox = Pbox.new
  end
  
  def create
    @pbox = current_user.pboxes.build(pbox_params)
    if @pbox.save
      flash[:success] = '新規作成に成功しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '新規作成に失敗しました。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  private # strongparameterの設定

    def pbox_params
      params.require(:pbox).permit(:name)
    end
end
