# frozen_string_literal: true
class Review < ActiveRecord::Base
  has_many :locationreviews
  has_many :locations, through: :locationreviews
  belongs_to :user

  validates :user_id, presence: true
  validates :rating, numericality: { only_integer: true }, inclusion: { in: 1..5, message: " must be between 1 - 5"}
  validates :flavor, presence: true
end
