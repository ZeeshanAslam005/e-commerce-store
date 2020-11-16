class UsersController < ApplicationController
    before_action :find_user, only: [:show]
    before_action :check_authorization
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

    def check_authorization
        redirect_to products_path unless current_user.admin?
    end

end