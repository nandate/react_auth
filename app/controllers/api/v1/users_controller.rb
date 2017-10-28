module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user,
                    only: [:show, :edit, :update, :destroy,
                    :borrowed_products, :saling_products, :sold_products]

      def index
        @users = User.all
      end

      def new
        @user = User.new
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: 201
        else
          render json: @user.errors, status: 422
        end
      end

      def show
        render json: @user, status: 200
      end

      def edit
        if @user
          render json: @user, only: [:email,:name], status: 200
        else
          render text: "Unidentified user", status: 422
        end
      end

      def update
        if @user.update(user_params)
          render json: @user, status: 200
        else
          render json: @user.errors, status: 422
        end
      end

      def destroy
        @user.destroy
        head :no_content
      end

      def borrowed_products
        render json: @user.borrowed_products, status: 200
      end

      def saling_products
        render json: @user.saling_products, status: 200
      end

      def sold_products
        render json: @user.sold_products, status: 200
      end

      private

        def set_user
          @user = User.find_by(access_token: params[:access_token])
        end

        def user_params
          params.require(:user).permit(:name,:email,:password,:password_confirmation)
        end

    end
  end
end
