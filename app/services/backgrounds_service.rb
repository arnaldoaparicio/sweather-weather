class BackgroundsService
  def self.conn
    Faraday.new(url: 'https://api.unsplash.com/') do |faraday|
      faraday.params['client_id'] = ENV['unsplash_api_key']
    end
  end

  def self.background_image(search)
    response = conn.get('search/photos') do |request|
      request.params['client_id'] = ENV['unsplash_key']
      request.params['per_page'] = 1
      request.params['orientation'] = 'landscape'
      request.params['query'] = search
    end
    JSON.parse(response.body, symbolize_names: true)
  end
end
