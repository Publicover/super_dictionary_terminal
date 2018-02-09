# require_relative "oxford_dictionary"
# require_relative "urban_dictionary"
# require_relative "webster_dictionary"
require 'HTTParty'
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
      defs = []
      # response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"]
      def_block = response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"]
      def_block.each do |word|
        defs << word["definitions"]
      end
      puts defs
    end
  end

  def self.webster_call(term)
    response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{term}?key=#{ENV["WEBSTER_KEY"]}")
    if response.include?("suggestion")
      "FAILED"
    else
      defs = []
      doc_response = Nokogiri::XML(response)
      # doc_response.xpath('//dt').first
      defs << doc_response.css('dt').text.gsub!(':', "\n")
      # defs.each do |item|
      #   puts item.gsub!(':', "\n")
      # end
    end
  end

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

  def self.call_dictionaries(word)
    puts "-----------"
    puts "From Oxford: "
    puts Word.oxford_call(word)
    puts "-----------"
    puts "From Webster: "
    puts Word.webster_call(word)
    puts "-----------"
    puts "From Urban Dictionary: "
    puts Word.urban_call(word).to_s
    puts "-----------"
  end

  # def self.call_full_oxford(term)
  # response = HTTParty.get("https://od-api.oxforddictionaries.com:443/api/v1/entries/en/#{term}",
  #   :headers => {
  #     "Accept": "application/json",
  #     "app_id": "#{ENV['OXFORD_APP_ID']}",
  #     "app_key": "#{ENV['OXFORD_APP_KEY']}"
  #   })
  #   if response.include?("!DOCTYPE")
  #     "NOPE"
  #   else
  #     definition = response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"]
  #     response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"]
  #
  #     # subsense = response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["subsenses"]
  #     # subsense.each { |word| p word}
  #     # print definition[0]
  #     # print subsense[0]
  #   end
  # end

end

# # THE BELOW WORKS, NEED TO ADJUST WEBSTER FORMAT
# puts "Give me a word."
# input = gets.chomp
# puts " "
# new_word = input
# puts " "
# puts "Your word is: #{new_word}."
# puts " "
# puts Word.call_dictionaries(input)
# # puts Word.oxford_call(input)



# TRANSLATING TO RAILS:
# USE #.exists? to check if word already exists in the database

puts "Give me a word."
input = gets.chomp
# response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{input}?key=#{ENV["WEBSTER_KEY"]}")
# puts Word.webster_call(input)
# puts Word.call_dictionaries(input)
# puts Word.call_full_oxford(input)
# puts Word.webster_call(input)
# puts Word.urban_call(input)
puts Word.call_dictionaries(input)
