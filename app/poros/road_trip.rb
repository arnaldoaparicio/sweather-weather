class RoadTrip
  attr_reader :id, :start_city, :end_city, :travel_time
  def initialize(attributes)
    @id = nil
    @start_city = attributes[:route][:locations][0][:adminArea5] + ', ' + attributes[:route][:locations][0][:adminArea3]
    @end_city = attributes[:route][:locations][1][:adminArea5] + ', ' + attributes[:route][:locations][1][:adminArea3]
    @travel_time = attributes[:route][:formattedTime]
  end
end
