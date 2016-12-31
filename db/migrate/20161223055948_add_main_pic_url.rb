class AddMainPicUrl < ActiveRecord::Migration
  def change
  	add_column :posts, :main_picture_url, :text
  end
end
