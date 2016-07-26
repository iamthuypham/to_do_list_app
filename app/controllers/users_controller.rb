class UsersController < ApplicationController
  def new
  end
  def create
  end
  def show
    @user = User.find(params[:id])
    # @tasks = @user.tasks.visible_to(current_user)
    # @user.name = params[:user][:name]
  end
end
