require 'httparty'

class Base
	include HTTParty

	def initialize (config = {})
		raise "Without Access Token" if !config.include? :access_token
		@config = config
		@url = base_url

		@ml_services = [{ :method => :currencies, :request => :currencies }]

		@methods = @ml_services.map { |service| service[:method] }
	end

	def method_missing(method, *args)
		if @methods.include? method
			request_from_ml method
		        self
		elsif method == :find
			parameterize args.first  if !args.first.nil?
			response = self.class.get(@url).parsed_response
			puts response
		else
			puts "Invalid method"
		end
	end


	def base_url
		return "https://api.mercadolibre.com"
	end

	def request_from_ml(method)
		@ml_services.each do |service|
			@url << '/' << service[:request].to_s if service.values.include? method
		end
	end

	def parameterize(options)
		options.keys.each_with_index do |parameter,index|
			index == 0 ? @url << "/?#{parameter}=#{options[parameter]}" : @url << "&#{parameter}=#{options[parameter]}"
		end
	end

end
