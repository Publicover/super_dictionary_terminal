class WebsterDictionary

  def webster_call(term)
    webster_response = HTTParty.get("http://www.dictionaryapi.com/api/v1/references/collegiate/xml/#{term}?key=#{ENV["WEBSTER_KEY"]}")
    if webster_response.include?("suggestion")
      "FAILED"
    else
      doc_response = Nokogiri::XML(webster_response)
      doc_response.xpath('//dt').first
    end
  end

end
