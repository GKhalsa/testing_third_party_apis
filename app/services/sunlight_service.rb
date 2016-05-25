class SunlightService

  def initialize
    @_conn = Faraday.new(url: "http://congress.api.sunlightfoundation.com")
  end


  def legislators(params)
    results(params)
  end

  # def legislators(params)
  # #   conn = Faraday.new(url: "http://congress.api.sunlightfoundation.com")
  # #   response = conn.get "/legislators", params.merge(apikey: "c61d83c9de2940cc896b966aed3ea3e4")                       #remember the slashes
  #   results = JSON.parse(response(params).body)["results"]
  #   results.map {|raw_legislator|
  #     OpenStruct.new(raw_legislator)
  #   }
  # end

  def results(params)
    results = JSON.parse(response(params).body, symbolize_names: true)[:results]
  end

  def response(params)
    @what = conn.get "/legislators", params.merge(apikey: "#{ENV['SUNLIGHT_KEY']}")                       #remember the slashes
  end

  private
    def conn
      @_conn
    end
end
