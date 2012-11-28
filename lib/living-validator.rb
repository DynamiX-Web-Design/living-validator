require 'rubygems'
require 'httparty'
require 'json'
require 'cgi'
require 'uri'
require 'living-validator/version'
#
# A module for all classes pertaining to the living validator source code
#
module LivingValidator

	# Default validator URL
	ENDPOINT = 'validator.nu'
	# Use lax content type checking
	LAX_TYPE = false

	#
	# Validator class. Should be accesses statically
	#
	class Validator
		def self.check(url, options = {})
			# Determine the endpoint url
			endpoint = options[:endpoint] || ENDPOINT
			# Determine if you should use the lax content type
			lax_type = options[:lax_type] || LAX_TYPE

			# Build the URL to query the validator
			req_url = 'http://' + endpoint + '/?out=json' + ((lax_type)? '&laxtype=yes':'') + '&doc=' + CGI::escape(url.to_s)

			# Query the validator
			response = false
			begin
				req_uri = URI.parse(req_url)
				response = HTTParty.get(req_url)
				response = JSON.parse(response.body)
			rescue 
				response = false
			end

			# Build a results object if the query succeeded
			unless response == false
				result = Result.new(url.to_s, response['messages'])
				response = result
			end

			# Return the results object
			response
		end
	end

	#
	# Validator results class with convenience functions
	#
	class Result
		attr_reader :messages, :url

		#
		# Construct a new result set from the url and messages
		# @param string url the url of the site checked
		# @param array messages the array of messages from the validator
		def initialize(url, messages)
			@messages = messages
			@url = url
		end

		#
		# Get the number of errors returned
		# @return integer the error count
		def errorCount
			(self.errors()).length
		end

		#
		# Get only the error messages
		# @return array the error messages
		def errors
			@messages.select{|msg| msg['type'] == 'error'}
		end

		#
		# Get the total messages count
		# @return integer the messages count
		def messageCount
			@messages.length
		end

	end

end
