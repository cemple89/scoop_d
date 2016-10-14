class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :count, default: 0
      t.belongs_to :review, null: false
      t.belongs_to :user, null:false
      t.timestamps  
    end
  end
end
