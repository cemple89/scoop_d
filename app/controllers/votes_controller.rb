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
      end
    else vote.nil?
      @vote = Vote.create(
        user: user,
        review: review,
        count: value
      )
    end


    #
    # userdownvote = Vote.find_by(count: -1,review_id: @review.id, user_id: current_user.id)
    # userupvote = Vote.find_by(count: 1,review_id: @review.id, user_id: current_user.id)
    # if userdownvote.nil?
    #   if userupvote.nil?
    #     vote = @review.votes.create
    #     vote.update_attribute(:user_id, current_user.id)
    #     vote.update_attribute(:count, -1)
    #     redirect_to location_path(@review.location)
    #   else
    #     userupvote.delete
    #     vote = @review.votes.create
    #     vote.update_attribute(:user_id, current_user.id)
    #     vote.update_attribute(:count, -1)
    #     redirect_to location_path(@review.location)
    #   end
    # else userupvote.nil?
    #   userdownvote.delete
    #   redirect_to location_path(@review.location)
    # end
    #
      respond_to do |format|
        format.json {render :json => @vote }
      end
    end

end
