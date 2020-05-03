class RefrigeratorsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @refrigerators = current_user.refrigerators.where(id: 1..999)
  end
  
  def new
    @user = User.find(params[:user_id])
    @refrigerator = Refrigerator.new
  end
  
  def create
    @user = User.find(params[:user_id])
    @refrigerator = @user.refrigerators.new(refrigerator_params)
    if @refrigerator.save
      flash[:success] = '冷蔵・冷凍庫に食品を追加しました。'
      redirect_back(fallback_location: root_path)
    else
      flash[:danger] = '名前が入力されていません。'
      redirect_back(fallback_location: root_path)
    end
  end
  
  def edit
    @refrigerator = Refrigerator.find(params[:id])
  end
  
  def update
    @refrigerator = Refrigerator.find(params[:id])
    if @refrigerator.update_attributes(refrigerator_params)
      flash[:success] = 'データを更新しました。'
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  def destroy
    @refrigerator = Refrigerator.find(params[:id])
    @refrigerator.destroy
    flash[:success] = "データを削除しました。"
    redirect_back(fallback_location: root_path)
  end
  
  private # strongparameterの設定

    def refrigerator_params
      params.require(:refrigerator).permit(:name)
    end
  
end
