class RoadTripService
  def self.conn
    Faraday.new(url: 'http://www.mapquestapi.com/') do |faraday|
      faraday.params['key'] = ENV['geo_key']
    end
  end

  def self.roadtrip_directions(from, to)
    response = conn.get('directions/v2/route') do |request|
      request.params['from'] = from
      request.params['to'] = to
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
