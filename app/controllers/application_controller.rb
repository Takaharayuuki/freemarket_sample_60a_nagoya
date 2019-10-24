class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_parents

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end
  end

  def production?
    Rails.env.production?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :last_name,:first_name,:last_name_kana,:first_name_kana,:birth_year,:birth_month,:birth_day])
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def redirect_to_login_form_unless_signed_in
    redirect_to new_user_session_path unless user_signed_in?
  end

end