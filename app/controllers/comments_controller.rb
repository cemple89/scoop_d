class CommentsController < ApplicationController

  def new
    @review = Review.find(:review_id)
    @location = Location.find(params[:id])
    @comment = Comment.new
  end

  def index
    @review = Review.find(params[:review_id])
    @comments = @review.comments
  end

  def create
    @reviews = Review.all
    @review = @location.reviews.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment added successfully."
      redirect_to location_review_path(@review)
    else
      flash[:notice] = @comment.errors.full_messages.join(", ")
      render 'locations/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:review_id, :user_id, :body)
  end
end
