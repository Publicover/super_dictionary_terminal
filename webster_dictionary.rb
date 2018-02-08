require 'httparty'
require 'nokogiri'

class WebsterDictionary
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
end

puts 'word please'
input = gets.chomp

puts WebsterDictionary.webster_call(input)
