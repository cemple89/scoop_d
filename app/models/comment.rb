# frozen_string_literal: true
class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :review

  validates :user, presence: true
  validates :review, presence: true
  validates :body, presence: true
end
