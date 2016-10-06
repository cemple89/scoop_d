# frozen_string_literal: true
class Review < ActiveRecord::Base
  RATINGS = [
    [1, 'scoop'],
    [2, 'scoops'],
    [3, 'scoops'],
    [4, 'scoops'],
    [5, 'scoops']
            ]

  belongs_to :location
  belongs_to :user

  validates :user_id, presence: true
  validates :rating, numericality: { only_integer: true },
  inclusion: { in: RATINGS.map { |rating| rating[0] } }
  validates :flavor, presence: true
end
