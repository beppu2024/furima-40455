class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def create
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
