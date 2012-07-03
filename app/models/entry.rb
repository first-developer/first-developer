class Entry < ActiveRecord::Base

	# ATTRIBUTES
	attr_accessible  :title, :body
	attr_reader      :category_tokens

	# ASSOCIATIONS
	has_and_belongs_to_many 	:categories

	# VALIDATIONS
	validates :title, :body, :presence => true

	# METHODS

	def category_tokens=(tokens)
		# tokens is like '[],cat1, ‚Ä¶etc'
		real_tokens = tokens.split(",")
		real_tokens = real_tokens.shift		# Remove the [] value for tokens
		self.category_ids = real_tokens
	end

end
