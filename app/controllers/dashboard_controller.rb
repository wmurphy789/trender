class DashboardController < ApplicationController
 	# def index
 	# 	if !params[:search].nil?
 	# 		require 'benchmark'
	 # 		req = Vacuum.new
	 		
	 # 		req.configure(
		# 	    aws_access_key_id: 'AKIAJYIA6QBYLLSNIY2Q',
		# 	    aws_secret_access_key: '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',
		# 	    associate_tag: 'trenderco-20'
		# 	)

		# 	rg = %w(ItemAttributes Images).join(',')
		# 	@res = req.item_search(
		# 	  query: {
		# 	    'ItemSearch.Shared.SearchIndex'   => 'All',
		# 	    'ItemSearch.Shared.Keywords'      => params[:search],
		# 	    'ItemSearch.Shared.ResponseGroup' => rg,
		# 	    'ItemSearch.Shared.ItemPage' => params["count"]
		# 	  },
		# 	  persistent: true
		# 	)
		# 	@items = @res.to_h
		# 	@items = @items['ItemSearchResponse']['Items']['Item']
		

		# 	render :action => 'index.js.erb'
		# else 
		# 	@items = nil
 	# 	end
 	# end

 	def index
 		require 'amazon/ecs'

		# default options:
		#  options[:version] => "2013-08-01"
		#  options[:service] => "AWSECommerceService"
		Amazon::Ecs.configure do |options|
		  options[:AWS_access_key_id] = 'AKIAJYIA6QBYLLSNIY2Q'
		  options[:AWS_secret_key] = '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'
		  options[:associate_tag] = 'trenderco-20'
		end

		# to overwrite the whole options
		# Amazon::Ecs.options = { ... }

		# options will be merged with the default options
		res = Amazon::Ecs.item_search('ruby', {:response_group => 'Large', :sort => 'salesrank'})

		# search amazon uk
		# res = Amazon::Ecs.item_search('ruby', :country => 'uk')

		# search all items, default search index: Books
		res = Amazon::Ecs.item_search('ruby', :search_index => 'All')

		res.is_valid_request?
		res.has_error?
		res.error                                 # error message
		res.total_pages
		res.total_results
		res.item_page                             # current page no if :item_page option is provided

		# find elements matching 'Item' in response object
		res.items.each do |item|
		  # retrieve string value using XML path
		  item.get('ASIN')
		  item.get('ItemAttributes/Title')

		  # return Amazon::Element instance
		  item_attributes = item.get_element('ItemAttributes')
		  item_attributes.get('Title')
		  puts item_attributes.get('Title')

		  item_attributes.get_unescaped('Title') # unescape HTML entities
		  item_attributes.get_array('Author')    # ['Author 1', 'Author 2', ...]
		  item_attributes.get('Author')          # 'Author 1'

		  # return a hash object with the element names as the keys
		  item.get_hash('SmallImage') # {:url => ..., :width => ..., :height => ...}

		  # # return the first matching path
		  # item_height = item.get_element('ItemDimensions/Height')
		  # item_height.attributes['Units']        # 'hundredths-inches'

		  # there are two ways to find elements:
		  # 1) return an array of Amazon::Element
		  # reviews = item.get_elements('EditorialReview')
		  # reviews.each do |review|
		  #   el.get('Content')
		  # end
		end
 	end

end
