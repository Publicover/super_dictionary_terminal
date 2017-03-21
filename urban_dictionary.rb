class UrbanDictionary

  def initialize(term)

    @urban_response = HTTParty.get("https://mashape-community-urban-dictionary.p.mashape.com/define?term=#{term}",
      headers:{
        "X-MASHAPE-KEY" => ENV["MASHAPE_TEST_KEY"],
        "Accept" => "text/plain"
        })
    end

    def valid_urban?(response)
      if response["result_type"]
        "NOPE"
      else
        response["list"][0]["definition"]
      end
    end

end
