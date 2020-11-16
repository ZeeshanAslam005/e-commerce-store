class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!


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
end
