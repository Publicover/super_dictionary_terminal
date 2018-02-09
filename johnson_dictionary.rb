require 'nokogiri'
require 'httparty'

class JohnsonDictionary
token = ""
# def authorized?
#   auth = false
# end

  def initialize
    @token = String.new
  end

  def self.check_auth
    unless @token
      response = HTTParty.post("https://samueljohnsonapi.herokuapp.com/auth/login",
        :body => {
          "name": "#{ENV['JOHNSON_API_NAME']}",
          "email": "#{ENV['JOHNSON_API_EMAIL']}",
          "password": "#{ENV['JOHNSON_API_PASS']}"
          # "name" => "admin",
          # "email" => "jim@home.com",
          # "password" => "jimjimjim"
        }
        # },
        # :headers => { 'Content-Type' => 'application/json' })
      )
      # auth_response = JSON.parse(response.body)
    # end
    # puts token = response["auth_token"]
      @token = response['auth_token']
    # puts token
    end
  end

  def self.johnson_call(term)
    check_auth
    lookup = HTTParty.get("https://samueljohnsonapi.herokuapp.com/words/Noxious",
      :headers => {
        "name": "#{ENV['JOHNSON_API_NAME']}",
        "email": "#{ENV['JOHNSON_API_EMAIL']}",
        "password": "#{ENV['JOHNSON_API_PASS']}",
        "Authorization": "#{@token}"
      })
    puts lookup['definition']
  end
end

puts 'word please'
input = gets.chomp
JohnsonDictionary.johnson_call(input)
