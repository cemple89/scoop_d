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
      @locations = Location.find_by(user_id: @user)
      @locations.update_attribute(:user_id, -1)
      @reviews = Review.find_by(user_id: @user)
      @reviews.update_attribute(:user_id, -1)
      @votes = Vote.find_by(user_id: @user)
      @votes.destroy
      @user.destroy
      flash[:notice] = 'User was successfully deleted'
      redirect_to users_path
    end
  end
end
