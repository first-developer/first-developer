class Category < ActiveRecord::Base

	# ATTRIBUTES
	attr_accessible :name

	# ASSOCIATIONS
	has_and_belongs_to_many	:entries

	# VALIDATIONS
	validates :name, :presence => true

	# TODO: Avoid nil name values


	# METHODS

	def self.ids_from_tokens( tokens )
		# tokens is like 'cat1, ‚ ...etc'
		real_tokens = tokens.split(",")

		ids = {}   # Containing the newest category ids

		# Looking for all ready exist tokens
		real_tokens.each do |name| 
			category = Category.where(name: name)

			puts category.nil?
			id = 
			if category.empty?
				ids[name] = Category.create!(name: name).id
			else
				ids[name] = category.first.id
			end
		end

		ids.values
	end
end
