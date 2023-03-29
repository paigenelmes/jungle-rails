class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, :uniqueness => { :case_sensitive => false }, presence: true
  validates :password, length: { minimum: 8 }, presence: true
  validates :password_confirmation, length: { minimum: 8 }, presence: true

  def self.authenticate_with_credentials(email, password)
    #Find the user by email and strip white space
    user = User.find_by_email(email.strip)
    #If the the user exists and the password is correct, return user
    if user && user.authenticate(password)
      return user
    #Otherwise return nil 
    else
      return nil
    end
  end
end