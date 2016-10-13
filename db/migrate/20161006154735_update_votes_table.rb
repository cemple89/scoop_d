class UpdateVotesTable < ActiveRecord::Migration[5.0]
  def change
    change_column :votes, :count, :integer, default: 1
  end
end
