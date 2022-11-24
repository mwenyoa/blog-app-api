class Api::v1::UsersController < ApplicationController
  def index
    @users = User.includes(:posts, :comments, :likes).order(created_at: :desc)
    if @Users
      render json: @users, status: :ok
    else
      render json: { error: 'No users found' }, status: :not_found
    end
  end

  def show
    @user = User.find(params[:id])
    if @user
      render json: @user, status: :ok
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save!
      render json: @user, status: :created
    else
      render json: { error: 'Unable to create user' }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      render json: { message: 'User deleted successfully' }, status: :ok
    else
      render json: { error: 'Unable to delete user' }, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { error: 'Unable to update user' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :bio, :photo)
  end
end
