require 'rails_helper'

RSpec.describe BackgroundsFacade do
  it 'returns an image based on denver,co' do
    image = BackgroundsFacade.image('denver,co')

    expect(image).to be_a Background
  end
end
