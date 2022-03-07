class BackgroundSerializer
  # include JSONAPI::Serializer
  # set_type :image
  # # attributes :image
  # attributes :id, :location, :image_url, :credit
  def self.image_json(image)
    {
      "data": {
        "type": 'image',
        "id": 'null',
        "attributes": {
          "image": {
            "location": image.location,
            "image_url": image.image_url,
            "credit": image.credit
          }
        }
      }
    }
  end
end
