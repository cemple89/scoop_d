class AddImageurlColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :image_url, :string 
  end
end
