class Background
  attr_reader :id, :location, :image_url, :credit

  def initialize(attributes)
    @id = nil
    @location = attributes[:tags][0][:title] + ',' + attributes[:tags][1][:title]
    @image_url = attributes[:urls][:raw]
    @credit = { source: 'unsplash.com', author: attributes[:user][:name] }
  end
end
