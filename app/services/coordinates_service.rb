class CoordinatesService
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com/geocoding/v1/address') do |faraday|
      faraday.params['key'] = ENV['geo_key']
    end
  end

  def self.location_coordinates(city, state)
    response = conn.get do |request|
      request.params['location'] = "#{city},#{state}"
    end
    JSON.parse(response.body, symbolize_names: true)[:results][0][:locations][0]
  end
end
