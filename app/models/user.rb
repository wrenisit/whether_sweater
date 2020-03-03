class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates_confirmation_of :password

  has_secure_password

end
