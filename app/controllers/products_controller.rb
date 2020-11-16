class ProductsController < ApplicationController
    before_action :find_product, except: [:index, :new, :seller_product, :create]
    def index
        @products = Product.all.approve
    end

    def seller_product
        @products = current_user.products
        render 'index'
    end

    def show
    end

    def new
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)
        @product.user = current_user
        if @product.save
            redirect_to @product
        else
            render json: { errors: @product.errors.full_messages }, status: 422
        end 
    end

    def edit
    end

    def update
        @product.update_attributes(product_params)
        @product.status = "pending"
        if @product.save
            redirect_to @product
        else
            render json: { errors: @product.errors.full_messages }, status: 422
        end
    end

    def approve
        @product.update_attribute(:status, 'approve')
    end

    def disapprove
        @product.update_attribute(:status, 'disapprove')
    end

    private
    def product_params
        params.require(:product).permit(:name,:sku,attachments_attributes: [:id, :attachment, :attachment_cache, :_destroy])

    end

    def find_product
        @product = Product.find(params[:id])
    end
end

