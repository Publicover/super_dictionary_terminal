require 'HTTParty'
require 'nokogiri'

class OxfordDictionary
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
end

puts "word please"
input = gets.chomp

puts OxfordDictionary.oxford_call(input)
