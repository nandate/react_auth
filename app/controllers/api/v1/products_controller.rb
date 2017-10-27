module Api
  module V1
    class ProductsController < ApplicationController

      def create
        @product = current_user.products.build(product_params)
        if @product.save
          render json: @product, status: 201
        else
          render json @product.error, status: 422
        end
      end


      private
        def product_params
          params.require(:product).permit(:name, :image, :term, :region, :seller_id);
        end
    end
  end
end
