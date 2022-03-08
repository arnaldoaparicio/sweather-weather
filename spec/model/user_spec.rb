require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end

  it 'encrypts password' do
    test_user = User.create(email: 'example@mail.com', password: 'test123', password_confirmation: 'test123')
    expect(test_user).to_not have_attribute(:password)
    expect(test_user).to_not have_attribute(:password_confirmation)
    expect(test_user.password_digest).to_not eq('test123')
  end
end
