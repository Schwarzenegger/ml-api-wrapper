require 'ml-api-wrapper/base'

class MlApiWrapper

	def initialize(config = {})
		config = config
	end

	def method_missing(method, *args)
		Base.new(@config).send(method, args.first)
	end

end
