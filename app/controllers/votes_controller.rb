class VotesController < ApplicationController

  def create
    user = User.find(params[:user_id])
    review = Review.find(params[:review_id])
    value = params[:count]
    vote = Vote.find(review: review, user: user)

    if vote.present?
      vote.destroy
    end
    Vote.create(
      user: user,
      review: review,
      value: value
    )
    redirect_to location_path(@review.location)
  end

end
