##
# Auth logvisual gem
#
module Logvisual
  ##
  # Auth api
  class Auth < Api
    def self.signup(email, password)
      data = { email: email, password: password }
      request(:signup, data)
    end

    def self.signin(email, password)
      data = { email: email, password: password }
      request(:signin, data)
    end

    def self.request(type, data = {})
      fail 'Email is required' if data[:email].nil?
      fail 'Password is required' if data[:password].nil?

      path =  case type
              when :signup then '/auth/signup'
              when :signin then '/auth/signin'
              else '/auth/signup'
              end

      send_request(path, data)
    end
  end
end
