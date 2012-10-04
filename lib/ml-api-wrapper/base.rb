module MlApiWrapper

	class Base
		def initialize (options = {})
			 @options = options
			 @url = base_url
		end

		def base_url
			return "https://api.mercadolibre.com"
		end

	end
end