class UsersController < ApplicationController
  def index
    @users = User.all
    json_response(@users)
  end

  def create
    @user = User.create!(user_params)
    json_response(@user, :created)
  end

  def show
    json_response(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:name,:email,:password)
  end

end
