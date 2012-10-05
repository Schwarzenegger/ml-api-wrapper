require 'httparty'

class Base
	include HTTParty

	def initialize (config = {})
		@config = config
		@url = base_url

		@ml_services = [{ :method => :currencies, :request => :currencies }]

		@methods = @ml_services.map { |service| service[:method] }
	end

	def base_url
		return "https://api.mercadolibre.com"
	end

	def request_from_ml(method)
		@ml_services.each do |service|
			@url << '/' << service[:request].to_s if service.values.include? method
		end
		response = self.class.get(@url).parsed_response
	end

	#make requests
	def method_missing(method, *args)
		if @methods.include? method
			request_from_ml method
			response = self.class.get(@url).parsed_response
		else
			raise NoMethodError
		end
	end

end