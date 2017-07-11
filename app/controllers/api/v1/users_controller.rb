module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only: [:show, :edit, :update, :destroy]

      def index
        @users = User.all
        render json: @users, status: 200
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: 201
        else
          render json: @user.errors, status:422
        end
      end

      def show
        render json: @user, status: 200
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

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.permit(:name,:email,:password)
      end

    end
  end
end
