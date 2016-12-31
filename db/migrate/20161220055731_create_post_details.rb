class CreatePostDetails < ActiveRecord::Migration
  def change
    create_table :post_details do |t|
    	t.string :url
    	t.decimal :price
    	t.timestamps null: false
    end
  end
end
