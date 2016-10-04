class CommentsController < ApplicationController

  def new
    @review = Review.find(params[:review_id])
    @comment = Comment.new
  end

  def index
    @review = Review.find(params[:review_id])
    @comments = @review.comments
  end

  def create
    @review = Review.find(params[:review_id])
    @comment = @review.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment added successfully."
      redirect_to location_review_path(@review)
    else
      flash[:notice] = @comments.errors.full_messages.join(", ")
      render 'locations/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:review_id, :user_id, :body)
  end
end
