class AdjustUrl < ActiveRecord::Migration
  def change
  	change_column :posts, :url, :text
  end
end
