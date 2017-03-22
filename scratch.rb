require "HTTParty"
require 'nokogiri'
require "./oxford_dictionary"
require_relative "urban_dictionary"
require_relative "webster_dictionary"

# def three_at_once(first_term)
#   # puts "-----------"
#   oxford_valid?(first_term)
#   # puts "-----------"
#   # valid_urban?
#   # puts "-----------"
#   # webster_valid?(first_term)
#   # puts "-----------"
# end

def call_dictionaries(word)
  puts OxfordDictionary.new.oxford_call(word)
  puts WebsterDictionary.new.webster_call(word)
  puts UrbanDictionary.new.urban_call(word)
end

call_dictionaries("nothing")
# # # Urban Dictionary
# # urban_response = HTTParty.get("https://mashape-community-urban-dictionary.p.mashape.com/define?term=mkijnbhu",
# #   headers:{
# #     "X-MASHAPE-KEY" => ENV["MASHAPE_TEST_KEY"],
# #     "Accept" => "text/plain"
# #     })
#
# # puts urban_response["result_type"]
# #
# # def valid_urban?(response)
# #   if response["result_type"]
# #     "NOPE"
# #   else
# #     response["list"][0]["definition"]
# #   end
# # end
# #
# # puts valid?(urban_response)
#
# #
# # puts "---------"
# # puts "now for oxford!"
# # puts "---------"
# #
# # Oxford
# oxford_response = HTTParty.get("https://od-api.oxforddictionaries.com:443/api/v1/entries/en/asdfasdf",
#   :headers => {
#     "Accept": "application/json",
#     "app_id": "#{ENV['OXFORD_APP_ID']}",
#     "app_key": "#{ENV['OXFORD_APP_KEY']}"
#   })
#
# # puts "---------"
# # oxford_doc = Nokogiri::XML(oxford_response)
#
# def oxford_valid?(big_response)
#   # temp_doc = Nokogiri::XML(big_response)
#   # if big_response.xpath('//title')
#   #   "NOPE"
#   # else
#   #   big_response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"]
#   # end
#   if big_response.include?("!DOCTYPE")
#     "NOPE"
#   else
#     big_response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"]
#   end
# end
#
# puts oxford_valid?(oxford_response)





# puts oxford_response
# puts oxford_response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"]
# puts "---------"
#
# puts "---------"
# puts "now for webster!"
# puts "---------"
# webster
# webster_response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/big?key=#{ENV["WEBSTER_KEY"]}")
# http://www.dictionaryapi.com/api/v1/references/collegiate/xml/hypocrite?key=[YOUR KEY GOES HERE]

# doc = Nokogiri::XML(webster_response)

# puts doc

# def webster_valid?(response)
#   if response.include?("suggestion")
#     "FAILED"
#   else
#     doc_response = Nokogiri::XML(response)
#     doc_response.xpath('//dt').first
#   end
# end

# puts webster_valid?(webster_response)

# def webster_valid?(response)
#   # if response.xpath('//dt')
#     # response.xpath('//dt').first
#     if doc.include?("suggestion")
#       "THIS WORKED THIS WORKED"
#   else
#     # response.xpath('//suggestion')
#     "ELSE BRANCH"
#   end
# end
#
# puts webster_valid?(doc)
# puts doc.xpath('//dt').first

# new_doc = Nokogiri::HTML(open('https://sidewaysdictionary.com/#/term/api'))
# new_doc = HTTParty.get("https://sidewaysdictionary.com/#/term/api").parsed_response
# puts new_doc
