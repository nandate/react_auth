module Api
  module V1
    class ProductsController < ApplicationController
      before_action :set_product, only: [:show, :rent, :meet, ::get_seller, :get_borrower]

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
        if user.id != @product.seller_id
          if @product.update(borrower_id: user.id)
            render json: @product, status: 200
          else
            render json: @product.errors, status: 422
          end
        end
      end

      def meet
        user = User.find_by(access_token: params[:access_token])
        if user.id == @product.seller_id || user.id == @product.borrower_id
          if @product.update(is_meet: true)
            render json: @product, status: 200
          else
            render json: @product.errors, status: 422
          end
        end
      end

      def do_return
        if(user.id == @product.seller_id || user.id == @product.borrower_id)
          && @product.is_return == false
          if @product.update(is_return: true)
            render json: @product, status: 200
          else
            render json: @product.errors, status: 422
          end
        end
      end

      def get_seller
        render json: @product.seller, status: 200
      end

      def get_borrower
        user = User.find(@product.borrower_id)
        render json: user, status: 200
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
