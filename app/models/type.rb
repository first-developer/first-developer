class Type < ActiveRecord::Base

	# CONSTANTS
	TYPES = %w( post music flash video snippet update )

	# VALIDATIONS
	validates :name, :inclusion => {:in => TYPES}


end