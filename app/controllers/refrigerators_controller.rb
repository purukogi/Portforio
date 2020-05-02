class RefrigeratorsController < ApplicationController
  
  def index
    @user = User.find(params[:user_id])
    @refrigerators = current_user.refrigerators.where(id: 1..999)
  end
  
end
