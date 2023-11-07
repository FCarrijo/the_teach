class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :devise_controller?
  # skip_before_filter :verify_authenticity_token
  # layout :layout_by_resource
  #
  # def layout_by_resource
  #   if ['sign_in'].include?(action_name)
  #     "login"
  #   else
  #     "application"
  #   end
  # end

  # before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  #
  # def authenticate_user!
  #   if user_signed_in?
  #     # O usuário está autenticado, continue normalmente
  #   else
  #     # O usuário não está autenticado, redirecione para a tela de login
  #     redirect_to user_session_path
  #   end
  # end

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.for(:sign_up) << :name
  # end

  # protected
  #
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  # end
end

