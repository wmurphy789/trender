class EditPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :url
  	remove_column :posts, :listing_company
  	remove_column :posts, :price
  end
end
