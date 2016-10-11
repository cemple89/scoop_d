require 'pry'
class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    user = current_user.id
    review = Review.find(params[:review_id])
    value = params[:count]
    vote = Vote.find(review: review, user: user)
    if vote.present?
      vote.destroy
    end
    Vote.create(
      user: user,
      review: review,
      count: value
    )
    redirect_to location_path(@review.location)
  end

end
