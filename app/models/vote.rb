require 'pry'
class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :unique_user_and_review, presence: true, if: :unique_user_and_review

  def unique_user_and_review
    vote = Vote.find_by(review_id: :review_id, user_id: :user_id)
    !vote.nil?
  end
end
