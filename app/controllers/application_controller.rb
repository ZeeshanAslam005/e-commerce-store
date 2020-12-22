class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :configure_permitted_parameter, if: :devise_controller?

  def after_sign_up_path_for(resource)
      redirect_to_associated_root(resource)
  end

  def after_sign_in_path_for(resource)

    redirect_to_associated_root(resource)
  end

  def redirect_to_associated_root(resource)
    if resource.is_a?(User)
      if current_user.is_a?(Admin)
        users_path
    elsif current_user.is_a?(Seller)
        seller_product_products_path 
    elsif current_user.is_a?(Buyer)
          products_path
      else
        super
      end
    else
        super
    end
  end
    protected
 
  def configure_permitted_parameter
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :accept_invitation, keys: [:email]
  end
end
