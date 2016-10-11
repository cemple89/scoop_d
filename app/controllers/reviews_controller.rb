# frozen_string_literal: true

class ReviewsController < ApplicationController

  def new
    @location = Location.find(params[:location_id])
    @review = Review.new
    @rating_collection = Review::RATINGS
  end

  def create
    @location = Location.find(params[:location_id])
    @reviews = @location.reviews
    @location_review_users = []
    if !@reviews.empty?
      @reviews.each do |review|
        if review.user != current_user
          @location_review_users << review.user
        end
      end
    end
    @location_review_users.uniq!
    @review = @location.reviews.new(
      user: current_user,
      flavor: params[:review][:flavor],
      rating: params[:review][:rating],
      body: params[:review][:body],
      location: @location
    )
    if @review.save
      flash[:notice] = "Review added successfully."
      @location_review_users.each do |user|
        ReviewMailer.review_email(user, @review).deliver
      end
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
  if @review.user == current_user || current_user.admin?
    @review.destroy
    redirect_to location_path(@review.location)
  end
end

  private

  def review_params
    params.require(:review).permit(:current_user, :flavor, :rating, :body, :location_id, :review_id)
  end
end
