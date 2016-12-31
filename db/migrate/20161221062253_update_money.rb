class UpdateMoney < ActiveRecord::Migration
  def change
  	change_column :post_details, :price, :decimal, :precision => 8, :scale => 2
  end
end
