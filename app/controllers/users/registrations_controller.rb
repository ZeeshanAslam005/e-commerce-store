class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  def create
    params[:user] = params[:user]&.merge(type: params[:user][:type].capitalize)
    super
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[type])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[type])
  end
  
end