module Api
  class UsersController < ApplicationController
    before_action :set_user

    def index
      @users = User.all
      json_response(@users)
    end

    def show
      json_response(@user)
    end

    def create
      @user = User.create(user_params)
      if @user.save
        json_response(@user)
      else
        json_response(@user.errors)
      end
    end

    

    private

    def set_user
      @user = User.find_by(params[:id])
    end

    def user_params
      params.permit(:name,:email,:password)
    end

  end
end
