class AddTotalToReviews < ActiveRecord::Migration[5.0]
  def change
        add_column :reviews, :total, :integer
  end
end
