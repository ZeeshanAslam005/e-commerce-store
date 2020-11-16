class UsersController < ApplicationController
    before_action :find_user, only: [:show]
    def index
        @sellers = Seller.all
        @buyers = Buyer.all
    end

    def show
        @products = @user.products
    end
private
    def find_user
        @user = User.find(params[:id])
    end
end