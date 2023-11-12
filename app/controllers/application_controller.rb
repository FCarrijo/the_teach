class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :set_ability
  rescue_from CanCan::AccessDenied, with: :access_denied

  private

  def set_ability
    @ability ||= Ability.new(current_user)
  end

  def access_denied(exception)
    flash[:alert] = "Acesso não permitido."
    redirect_to root_path # Ou para uma página de erro, ou qualquer outra página desejada
  end
end

