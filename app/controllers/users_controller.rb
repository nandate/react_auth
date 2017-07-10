class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
    json_response(@users)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      json_response(@user, :created)
    else
      json_response(@user.errors, :unprocessable_entity)
    end
  end

  def show
    json_response(@user)
  end

  def update
    if @user.update(user_params)
      json_response(@user)
    else
      json_response(@user.errors,:unprocessable_entity)
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
