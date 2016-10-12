class AddUserColumn < ActiveRecord::Migration[5.0]
  def change
    add_reference :locations, :user, null: false
  end
end
