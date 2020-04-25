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
    @user = User.find(params[:user_id])
    @pbox = Pbox.new(pbox_params)
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
      params.require(:pbox).permit(:id, :name, :user_id)
    end
end
