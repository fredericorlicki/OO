require_relative 'recipe'
require_relative 'csv'

class CookBook

	attr_reader :recipes

	def initialize(file)
		@file = file
		@recipes = CSV.load_recipes(file)
	end

	def list
  	puts @recipes
  end

  def add_recipe(info)
  	@recipes << Recipe.new(info)
  end

  def delete_recipe_with_index(index)
  	@recipes.delete_at(index)
  end

end
