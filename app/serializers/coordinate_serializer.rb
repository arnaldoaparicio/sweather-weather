class CoordinateSerializer
  include JSONAPI::Serializer

  attributes :latitude, :longitude

end
