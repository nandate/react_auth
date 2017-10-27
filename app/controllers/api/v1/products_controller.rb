module Api
  module V1
    class ProductsController < ApplicationController

      def create
        @product = Product.new(product_params)
        if @product.save
          render json: @product, status: 201
        else
          render json: @product.errors, status: 422
        end
      end


      private
        def product_params
          params.permit(:name, :image, :term, :region, :seller_id);
        end
    end
  end
end
