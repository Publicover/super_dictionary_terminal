require 'nokogiri'
require 'httparty'

# class Johnson
  token = []

  # def authorized?
    # if token.empty?
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
    puts response
  # end
# end
