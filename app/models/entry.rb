class Entry < ActiveRecord::Base

	# CONSTANTS
  

	# ATTRIBUTES
	attr_accessible  :title, :body, :category_tokens, :category_ids
	attr_reader :category_tokens

	# ASSOCIATIONS
	has_and_belongs_to_many 	:categories
	# has_one 					:type

	# VALIDATIONS
	validates :title, :body, :presence => true

	# METHODS

	def category_tokens=(tokens)
		self.category_ids = Category.ids_from_tokens(tokens)
	end


	# Returns a string with elements separated by comma
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


	# To check whether an entry has its type included in Type::TYPES
	# Type::TYPES.each do |type| 
	# 	define_method "#{type}?" do
	# 		type.exists?(:name => role_type) 
	# 	end
	# end

end

