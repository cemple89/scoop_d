# frozen_string_literal: true
class AddReviewsBelongsTo < ActiveRecord::Migration[5.0]
  def change
    add_reference(:reviews, :location, null: false)
  end
end
