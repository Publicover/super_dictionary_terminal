class WebsterDictionary

  def initialize(term)
    webster_response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{term}?key=#{ENV["WEBSTER_KEY"]}")
    webster_doc = Nokogiri::XML(webster_response)
  end

  def webster_valid?(response)
    if response.include?("suggestion")
      "FAILED"
    else
      doc_response = Nokogiri::XML(response)
      doc_response.xpath('//dt').first
    end
  end

end
