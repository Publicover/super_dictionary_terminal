require "HTTParty"
require 'nokogiri'


def valid?(call)
  if call == nil
    "NOPE"
  else
    call
  end
end



# Urban Dictionary
urban_response = HTTParty.get("https://mashape-community-urban-dictionary.p.mashape.com/define?term=mkijnbhu",
  headers:{
    "X-MASHAPE-KEY" => ENV["MASHAPE_TEST_KEY"],
    "Accept" => "text/plain"
    })

# puts urban_response["result_type"]

def valid?(response)
  if response["result_type"]
    "NOPE"
  else
    response["list"][0]["definition"]
  end
end

puts valid?(urban_response)

# puts urban_response["list"][0]["definition"]
#
# puts "---------"
# puts "now for oxford!"
# puts "---------"
#
# # Oxford
# oxford_response = HTTParty.get("https://od-api.oxforddictionaries.com:443/api/v1/entries/en/butt",
#   :headers => {
#     "Accept": "application/json",
#     "app_id": "#{ENV['OXFORD_APP_ID']}",
#     "app_key": "#{ENV['OXFORD_APP_KEY']}"
#   })
#
# puts "---------"
# puts oxford_response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"]
# puts "---------"
#
# puts "---------"
# puts "now for webster!"
# puts "---------"
# # webster
# webster_response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/butt?key=#{ENV["WEBSTER_KEY"]}")
# # http://www.dictionaryapi.com/api/v1/references/collegiate/xml/hypocrite?key=[YOUR KEY GOES HERE]
#
# doc = Nokogiri::XML(webster_response)
#
# puts doc.xpath('//dt')
#
# # new_doc = Nokogiri::HTML(open('https://sidewaysdictionary.com/#/term/api'))
# # new_doc = HTTParty.get("https://sidewaysdictionary.com/#/term/api").parsed_response
# # puts new_doc
