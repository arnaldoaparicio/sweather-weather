class BackgroundsFacade

  def self.image(city)
    pic = BackgroundsService.background_image(city)[:results][0]
    Background.new(pic)
  end
end
