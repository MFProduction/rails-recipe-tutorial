class Ingredient < ActiveRecord::Base
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients
	
	# Validations
	validates :name, presence: true, length: {minimum: 2, maxuimum:25 }
end