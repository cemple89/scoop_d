# frozen_string_literal: true
class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.all
    end
  end

  def edit
    @user = current_user
    @image = @user.image
  end

  def update
    @user = current_user
    @user.image = params[:user][:image]
    @user.save!
    # @uploader.store!(params[:image])
    # @image = @user.store!(image_params)
    redirect_to root_path
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
