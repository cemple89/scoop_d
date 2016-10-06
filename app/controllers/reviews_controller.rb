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

def upvote
  @review = Review.find(params[:id])
  userupvote = Vote.find_by(count: 1,review_id: @review.id, user_id: current_user.id)
  userdownvote = Vote.find_by(count: -1,review_id: @review.id, user_id: current_user.id)
  # if current_user already voted on review
  if userupvote.nil?
    if userdownvote.nil?
      vote = @review.votes.create
      vote.update_attribute(:user_id, current_user.id)
      redirect_to location_path(@review.location)
    else
      userdownvote.delete
      vote = @review.votes.create
      vote.update_attribute(:user_id, current_user.id)
      redirect_to location_path(@review.location)
    end
  end
end

def downvote
  @review = Review.find(params[:id])
  userdownvote = Vote.find_by(count: -1,review_id: @review.id, user_id: current_user.id)
  userupvote = Vote.find_by(count: 1,review_id: @review.id, user_id: current_user.id)
  if userdownvote.nil?
    if userupvote.nil?
      vote = @review.votes.create
      vote.update_attribute(:user_id, current_user.id)
      vote.update_attribute(:count, -1)
      redirect_to location_path(@review.location)
    else
      userupvote.delete
      vote = @review.votes.create
      vote.update_attribute(:user_id, current_user.id)
      vote.update_attribute(:count, -1)
      redirect_to location_path(@review.location)
    end
  end
end

  private
  def review_params
    params.require(:review).permit(:current_user, :flavor, :rating, :body)
  end
end
