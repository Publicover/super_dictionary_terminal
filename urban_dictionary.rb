class UrbanDictionary

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

end
