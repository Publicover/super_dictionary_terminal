class WebsterDictionary

  def webster_call(term)
    response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{term}?key=#{ENV["WEBSTER_KEY"]}")
    if response.include?("suggestion")
      "FAILED"
    else
      doc_response = Nokogiri::XML(response)
      doc_response.xpath('//dt').first
    end
  end

end
