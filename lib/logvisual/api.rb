require 'net/http'
require 'json'
##
# Api logvisual gem
#
module Logvisual
  ##
  # Api class
  #
  class Api
    def self.send_request(endpoint, data = {}, token = nil)
      uri = URI('http://api.logvisual.co/v1' + endpoint)
      http = Net::HTTP.new(uri.host, uri.port)
      body = URI.encode_www_form(data)
      req = Net::HTTP::Post.new(uri)
      req.add_field('AUTHORIZATION', token) if token
      req.body = body
      JSON.parse(http.request(req).body)
    end
  end
end
