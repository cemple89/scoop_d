# frozen_string_literal: true
class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.belongs_to :review, null: false
      t.belongs_to :user, null:false

      t.timestamps 
    end
  end
end
