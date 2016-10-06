# frozen_string_literal: true
require 'pry'

class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @location = Location.find(params[:location_id])
    @review = Review.new
    @rating_collection = Review::RATINGS
  end

  def create
    @location = Location.find(params[:location_id])
    @reviews = @location.reviews
    @review = @location.reviews.new(
      user: current_user,
      flavor: params[:review][:flavor],
      rating: params[:review][:rating],
      body: params[:review][:body],
      location: @location
    )
    if @review.save
      flash[:notice] = "Review added successfully."
      redirect_to location_path(@location)
    else
      flash[:notice] = @review.errors.full_messages.join(", ")
      render 'locations/show'
    end
  end

def edit
  @review = Review.find(params[:id])
  @location = @review.location
  @rating_collection = Review::RATINGS
end

def update
  @review = Review.find(params[:id])
  @review.update_attributes(review_params)
  if @review.save
    redirect_to location_path(@review.location)
  else
    render action: 'edit'
  end
end

def destroy
  @review = Review.find(params[:id])
  if @review.user_id == current_user.id || current_user.admin?
    @review.destroy
    redirect_to location_path(@review.location)
  end
end

  private

  def review_params
    params.require(:review).permit(:current_user, :flavor, :rating, :body, :location_id, :review_id)
  end
end
