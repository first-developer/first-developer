class Entry < ActiveRecord::Base

	# ATTRIBUTES
	attr_accessible  :title, :body, :category_tokens, :category_ids
	attr_reader :category_tokens

	# ASSOCIATIONS
	has_and_belongs_to_many 	:categories

	# VALIDATIONS
	validates :title, :body, :presence => true

	# METHODS

	def category_tokens=(tokens)
		self.category_ids = Category.ids_from_tokens(tokens)
	end

	def categories_stringlified
		result = ""
		cats = categories;
		unless ( cats.blank? ) 
			arr_result = cats.collect do |c|
				c.name
			end
			result = arr_result.join(",")
		end
		return result
	end 

end

