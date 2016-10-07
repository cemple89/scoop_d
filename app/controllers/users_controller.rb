require 'pry'
# frozen_string_literal: true
class UsersController < ApplicationController
  def index
    if current_user.admin?
      @users = User.all
    end
  end

  def edit
    @user = current_user
    @uploader = ImageUploader.new
    @user_image = params
  end

  def update
    binding.pry
    @user = current_user
    @uploader.store!()
  end

  def destroy
    if current_user.admin?
      @user = User.find(params[:id])
      @user.destroy
      flash[:notice] = 'User was successfully deleted'
      redirect_to users_path
    end
  end

  private

  def image_params
    params.require(:image_params).permit(:id, :url)
  end
end
