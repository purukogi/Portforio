class PboxesController < ApplicationController
  def index
    @user = User.find(params[:id])
  end
  
  private # strongparameterの設定

    def pbox_params
      params.require(:pbox).permit(:name)
    end
end
