class User < ApplicationRecord
  validates_presence_of :email
  validates_uniqueness_of :email, case_sensitive: false

  has_secure_password(validations: true)
  has_secure_token :api_key

end
