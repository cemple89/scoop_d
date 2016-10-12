class RemoveUrlColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :locations, :url 
  end
end
