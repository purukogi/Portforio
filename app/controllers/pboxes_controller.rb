class PboxesController < ApplicationController
  def index
    @user = User.find_by(params[:user_id])
    @pboxes = Pbox.all
  end
  
  def show
  end
  
  def new
    @pbox = Pbox.new
  end
  
  def create
    @pbox = Pbox.new(pbox_params)
    if @pbox.save
      flash[:success] = '新規作成に成功しました。'
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private # strongparameterの設定

    def pbox_params
      params.require(:pbox).permit(:name)
    end
end
