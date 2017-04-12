# require "./oxford_dictionary"
# require_relative "urban_dictionary"
# require_relative "webster_dictionary"
require "HTTParty"
require 'nokogiri'

class Word

  def initialize(word)
    @word = word
  end

  def votes
    {oxford: 0, webster: 0, urban: 0}
  end

  def self.oxford_call(term)
    response = HTTParty.get("https://od-api.oxforddictionaries.com:443/api/v1/entries/en/#{term}",
      :headers => {
        "Accept": "application/json",
        "app_id": "#{ENV['OXFORD_APP_ID']}",
        "app_key": "#{ENV['OXFORD_APP_KEY']}"
      })
    if response.include?("!DOCTYPE")
      "NOPE"
    else
      response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"]
    end

  end

  def webster_call(term)
    response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{term}?key=#{ENV["WEBSTER_KEY"]}")
    if response.include?("suggestion")
      "FAILED"
    else
      doc_response = Nokogiri::XML(response)
      doc_response.xpath('//dt').first
    end
  end

  def urban_call(term)
    response = HTTParty.get("https://mashape-community-urban-dictionary.p.mashape.com/define?term=#{term}",
      headers:{
        "X-MASHAPE-KEY" => ENV["MASHAPE_TEST_KEY"],
        "Accept" => "text/plain"
        })
    if response["result_type"] == "no_results"
      "NOPE"
    else
      response["list"][0]["definition"]
    end
  end

  def self.call_dictionaries
    puts "-----------"
    puts urban_call(@word)
    puts "-----------"
    puts webster_call(@word)
    puts "-----------"
    puts urban_call(@word)
    puts "-----------"
  end

  # def votes
  #
  # end

end

puts "Give me a word."
input = gets.chomp
puts " "
new_word = input
puts " "
puts "Your word is: #{new_word}."
puts " "
puts Word.oxford_call(new_word)
puts " "
# new_word.oxford_call
