class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  # システム管理権限所有かどうか判定します。
  def admin_user
    if
      current_user.admin?
    elsif
      current_user.id != params[:id].to_i
      flash[:danger] = "編集権限がありません。"
      redirect_to(root_url)
    end
  end
end
