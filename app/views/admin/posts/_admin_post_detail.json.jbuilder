json.extract! admin_post_detail, :id, :url, :post_id, :listing_company, :price, :created_at, :updated_at
json.url admin_post_detail_url(admin_post_detail, format: :json)