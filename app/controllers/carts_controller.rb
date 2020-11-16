class CartsController < ApplicationController
    def index
        @carts = current_user.carts
    end

    def add_to
        product = Product.find(params[:id])
        current_user.carts.find_or_create_by(product: product)
    end
end