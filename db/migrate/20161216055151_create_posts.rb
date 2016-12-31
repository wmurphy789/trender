class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.decimal :price
      t.string :listing_company

      t.timestamps null: false
    end
  end
end
