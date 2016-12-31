class AddCompanyName < ActiveRecord::Migration
  def change
  	add_column :post_details, :listing_company, :string
  end
end
