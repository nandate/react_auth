module Api
  module V1
    class SessionsController < ApplicationController

      def new
      end

      def create
        user = User.find_by(email: params[:session][:email].downcase)
        if user && user.authenticate(params[:session][:password])
          render json:  user.access_token, status: 200
        else
          render plain: "Error with your login or password", status: 422
        end
      end

      def verify_access_token
        user = User.find_by(access_token: params[:session][:access_token])
        if user
          render plain: "verified", status: 200
        else
          render plain: "Token failed verification", status: 422
        end
      end

    end
  end
end
