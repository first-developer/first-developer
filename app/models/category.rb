class Category < ActiveRecord::Base

	# ASSOCIATIONS
	has_and_belongs_to_many	:entries
end
