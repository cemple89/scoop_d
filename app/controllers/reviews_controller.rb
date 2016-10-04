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
    @review = @location.reviews.new(review_params)
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
  @review.destroy
  redirect_to location_path(@review.location)
end

  private

  def review_params
    params.require(:review).permit(:user_id, :flavor, :rating, :body)
  end
end
