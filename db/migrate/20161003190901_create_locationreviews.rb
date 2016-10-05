# frozen_string_literal: true
class CreateLocationreviews < ActiveRecord::Migration[5.0]
  def change
    create_table :locationreviews do |t|
      t.belongs_to :location, null: false
      t.belongs_to :review, null: false

      t.timestamps 
    end
  end
end
