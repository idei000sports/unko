class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_current_user

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) # 新規登録時(sign_up時)にnameというキーのパラメーターを追加で許可する
  end

  def set_current_user
	@current_user = User.find_by(id: session[:user_id])
  end

end
