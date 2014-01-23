class Recipe

	def initialize(args={})
		@infos = args
	end

	def to_s
		values.join(' ')
	end

	def values
		@infos.values
	end

end
