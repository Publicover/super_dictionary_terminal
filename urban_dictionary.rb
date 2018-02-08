require 'nokogiri'
require 'httparty'
require 'json'

class UrbanDictionary

  def self.urban_call(term)
    response = HTTParty.get("https://mashape-community-urban-dictionary.p.mashape.com/define?term=#{term}",
      headers:{
        "X-MASHAPE-KEY" => ENV["MASHAPE_TEST_KEY"],
        "Accept" => "text/plain"
        })

    if response["result_type"] == "no_results"
      "NOPE"
    else
      defs = []
      # response["list"][0]["definition"]
      # if response["tags"]["list"] == "definition"
      #   defs << response["tags"]["list"]
      # end
      # parsed_response = JSON.parse(response.body)
      response["list"].each do |item|
        # if item == "definition"
          defs << item["definition"]
        # end
        # puts defs
        # puts item["definition"]
      end
      puts defs
    end
  end
end

puts 'word please'
input = gets.chomp

puts UrbanDictionary.urban_call(input)
