class AddPostId < ActiveRecord::Migration
  def change
  	add_column :post_details, :post_id, :integer
  end
end
