class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.all
    end
  end

  def destroy
    if current_user.admin?
      @user = User.find(params[:id])

      @user.destroy
      flash[:notice] = 'User was successfully deleted'
      redirect_to users_path
    end
  end
end
