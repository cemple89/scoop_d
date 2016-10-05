# frozen_string_literal: true
class Locationreview < ActiveRecord::Base
  belongs_to :location
  belongs_to :review

  validates :location, presence: true
  validates :review, presence: true
end
