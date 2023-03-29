require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "must contain a first name, last name, email, password and password confirmation" do
      #Create an example user
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: "Catn1p",
                          password_confirmation: "Catn1p")
      #Expect this user to be valid
      expect(@user).to be_valid
    end

    it "displays an error if the password and password confirmation don't match" do
      #Create an example user where the password & password confirmation don't match
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: "Catn1p!",
                          password_confirmation: "Catn1p")
      #Expect an error
      expect(@user.errors.full_messages).to be_present
    end
    it "displays an error if the first name is missing" do
      #Create an example user with no first name
      @user = User.create(first_name: nil,
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: "Catn1p",
                          password_confirmation: "Catn1p")
      #Expect an error
      expect(@user.errors.full_messages).to be_present
    end

    it "displays an error if the last name is missing" do
      #Create an example user with no last name
      @user = User.create(first_name: "Mai",
                          last_name: nil,
                          email: "mai@stripedtiger.com",
                          password: "Catn1p",
                          password_confirmation: "Catn1p")
      #Expect an error
      expect(@user.errors.full_messages).to be_present
    end

    it "displays an error if the email is missing" do
      #Create an example user with no email
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: nil,
                          password: "Catn1p",
                          password_confirmation: "Catn1p")
      #Expect an error
      expect(@user.errors.full_messages).to be_present
    end


    it "displays an error if the password is missing" do
      #Create an example user with no password
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: nil,
                          password_confirmation: "Catn1p")
      #Expect an error
      expect(@user.errors.full_messages).to be_present
    end

    it "displays an error if the password confirmation is missing" do
      #Create an example user with no password confirmation
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: "Catn1p",
                          password_confirmation: nil)
      #Expect an error
      expect(@user.errors.full_messages).to be_present
    end
  end
end
