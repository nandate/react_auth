module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :rent]

      def index
        @products = Product.where(borrower_id: nil)
        render json: @products, status: 200
      end

      def show
        @product = Product.find(params[:id])
        render json: @product, status: 200
      end

      def create
        user = User.find_by(access_token: params[:access_token])
        @product = user.saling_products.new(product_params)
        if @product.save
          render json: @product, status: 201
        else
          render json: @product.errors, status: 422
        end
      end

      def rent
        user = User.find_by(access_token: params[:access_token])

        if @product.update(borrower_id: user.id)
          render json: @product, status: 200
        else
          render json: @product.errors, status: 422
        end
      end

      private
        def product_params
          params.permit(:name, :image, :term, :region, :description);
        end

        def set_product
          @product = Product.find(params[:id])
        end
    end
  end
end
