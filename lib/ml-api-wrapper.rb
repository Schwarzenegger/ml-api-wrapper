require 'ml-api-wrapper/base'

module MlApiWrapper
	class << self

		def initialize(options = {})
			@options = options
		end

		def method_missing(m, *args, &block)
			puts "There's no method called #{m}"
		end

	end
end
