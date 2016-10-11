require 'pry'
class VotesController < ApplicationController

  def create
    user = current_user
    review = Review.find(params[:review_id])
    value = params[:count]
    vote = Vote.find_by(review: review.id, user: user.id)

    if vote.present?
      vote.destroy
    end

    @vote = Vote.create(
      user: user,
      review: review,
      count: value
    )

    respond_to do |format|
      format.json {render :json => @vote }
    end
  end

end
