class PboxesController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @pboxes = Pbox.all
    
  end
  
  def new
    @user = User.find(params[:user_id])
    @pbox = Pbox.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @pbox = @user.pboxes.new(pbox_params)
    if @pbox.save
      flash[:success] = '新規作成に成功しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '新規作成に失敗しました。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def edit
  end
  
  def update
    @pbox = Pbox.find_by(params[:user_id])
    if @pbox.update_attributes(pbox_params)
      flash[:success] = 'データを更新しました。'
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @pbox = Pbox.find_by(params[:user_id])
    @pbox.destroy
    flash[:success] = "データを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  private # strongparameterの設定

    def pbox_params
      params.permit(:pbox_name)
    end
end
