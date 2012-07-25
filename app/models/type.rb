class Type < ActiveRecord::Base

  # ATTRIBUTES
  attr_accessible :name
  # ASSOCIATIONS
  has_many  :entries

  # VALIDATIONS

  # METHODS
  

end
