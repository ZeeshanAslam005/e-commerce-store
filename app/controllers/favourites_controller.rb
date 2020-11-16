class FavouritesController < ApplicationController
    def index
        @favourites = current_user.favourites
    end

    def add_to
        product = Product.find(params[:id])
        current_user.favourites.create(product: product)
    end
end