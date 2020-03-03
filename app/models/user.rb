class User < ApplicationRecord

  validates :email, presence: true, uniqueness: true, case_sensitive: false
  validates_confirmation_of :password
  validates_presence_of :password_digest

  has_secure_password

end
