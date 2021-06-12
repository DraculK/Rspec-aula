class Api::V1::ProductsController < ApplicationController
    def create 
        product = Product.new(product_params)
        product.save!

        render json: product, status: :created 
    rescue StandardError => e  
        head(:bad_request)
    end
    
    def index 
        products = Product.all 
        render json: products, status: :ok
    end

    def show 
        product = Product.find(params[:id])

        render json: product, status: :ok
    rescue StandardError => e  
        head(:bad_request)
    end

    def update 
        product = Product.find(params[:id])
        product.update!(product_params)

        render product, status: :ok 
    rescue StandardError => e  
        head(:bad_request)
    end

    def delete 
        product = Product.find(params[:id])
        product.destroy!

        render product, status: :ok
    rescue StandardError => e  
        head(:bad_request)
    end

    private 
    def product_params
        params.require(:product).permit(
            :name,
            :description,
            :price,
            :category_id
        )
    end
end
