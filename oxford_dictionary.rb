class OxfordDictionary

  def initialize(term)
    @oxford_response = HTTParty.get("https://od-api.oxforddictionaries.com:443/api/v1/entries/en/#{term}",
      :headers => {
        "Accept": "application/json",
        "app_id": "#{ENV['OXFORD_APP_ID']}",
        "app_key": "#{ENV['OXFORD_APP_KEY']}"
      })
    end

    def oxford_valid?(response)
      if response.include?("!DOCTYPE")
        "NOPE"
      else
        response["results"][0]["lexicalEntries"][0]["entries"][0]["senses"][0]["definitions"]
      end
    end

end
