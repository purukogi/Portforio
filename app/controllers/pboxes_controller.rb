class PboxesController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @pboxes = current_user.pboxes.where(id: 1..999)
  end
  
  def new
    @user = User.find(params[:user_id])
    @pbox = Pbox.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @pbox = @user.pboxes.new(pbox_params)
    if @pbox.save
      flash[:success] = 'ボックスにアイテムを追加しました'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '名前が入力されていません'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def edit
    @pbox = Pbox.find(params[:id])
  end
  
  def update
    @pbox = Pbox.find(params[:id])
    if @pbox.update_attributes(pbox_params)
      flash[:success] = 'データを更新しました'
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @pbox = Pbox.find(params[:id])
    @pbox.destroy
    flash[:success] = "データを削除しました"
    redirect_back(fallback_location: root_path)
  end
  
  private # strongparameterの設定

    def pbox_params
      params.require(:pbox).permit(:pbox_name)
    end
end
