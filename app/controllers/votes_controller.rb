require 'pry'
class VotesController < ApplicationController

  def create
    user = current_user
    review = Review.find(params[:review_id])
    value = params[:count]
    vote = Vote.find_by(review: review.id, user: user.id)


    if vote.present?
      if vote.count != value.to_i
        vote.destroy
        @vote = Vote.create(
          user: user,
          review: review,
          count: value
        )
      elsif vote.count == value.to_i
        vote.destroy
        @vote = nil
      end
    else vote.nil?
      @vote = Vote.create(
        user: user,
        review: review,
        count: value
      )
    end

      respond_to do |format|
        format.json {render :json => @vote }
      end
    end

      def destroy
        @vote = Vote.find(params[:id])
        @vote.destroy
      end
end
