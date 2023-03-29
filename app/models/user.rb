class User < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }, presence: true
  validates :password, length: { minimum: 8 }, presence: true
  validates :password_confirmation, length: { minimum: 8 }, presence: true

  has_secure_password

end
