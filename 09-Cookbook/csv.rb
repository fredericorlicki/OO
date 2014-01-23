require_relative 'recipe'
require 'csv'

class CSV

	@categories = []

	class << self
		attr_accessor :categories
	end


	def self.load_recipes(file)
		CSV.open(file) do |f|
			CSV.categories = f.readline.map { |name| name.to_sym }
			table = []
			until f.eof?
				row = f.readline
				row = CSV.categories.zip(row).flatten
				table << Recipe.new(Hash[*row])
			end
			table
		end
	end

	def self.save_recipes(file, cookbook)
		CSV.open(file, 'w') do |csv|
			csv.puts(CSV.categories)
			cookbook.recipes.each do |recipe| 
				csv.puts(recipe.values)
			end
		end

	end

	# def self.delete_row(file, row_index)
	# 	temp = CSV.readlines(file)
	# 	temp.delete_at(row_index)
	# 	CSV.open(file, 'w') do |csv|
	# 	temp.each { |line| csv.puts(line) }
 #  	end
 #  end

end