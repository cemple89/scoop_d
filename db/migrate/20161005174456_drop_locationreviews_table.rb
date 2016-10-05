class DropLocationreviewsTable < ActiveRecord::Migration[5.0]
  def change
    drop_table :locationreviews
  end
end
