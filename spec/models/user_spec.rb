require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "must contain a first name, last name, email, password and password confirmation" do
      #Create an example user
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: "Catn1pTime",
                          password_confirmation: "Catn1pTime")
      #Expect this user to be valid & no error
      expect(@user).to be_valid
      expect(@user.errors.full_messages).to_not be_present

    end

    it "displays an error if the password and password confirmation don't match" do
      #Create an example user where the password & password confirmation don't match
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: "Catn1pTime!",
                          password_confirmation: "Catn1pTime")
     #Expect the user to not be valid with an error
     expect(@user).to_not be_valid
     expect(@user.errors.full_messages).to be_present
    end
    it "displays an error if the first name is missing" do
      #Create an example user with no first name
      @user = User.create(first_name: nil,
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: "Catn1pTime",
                          password_confirmation: "Catn1pTime")
     #Expect the user to not be valid with an error
     expect(@user).to_not be_valid
     expect(@user.errors.full_messages).to be_present
    end

    it "displays an error if the last name is missing" do
      #Create an example user with no last name
      @user = User.create(first_name: "Mai",
                          last_name: nil,
                          email: "mai@stripedtiger.com",
                          password: "Catn1pTime",
                          password_confirmation: "Catn1pTime")
     #Expect the user to not be valid with an error
     expect(@user).to_not be_valid
     expect(@user.errors.full_messages).to be_present
    end

    it "displays an error if the email is missing" do
      #Create an example user with no email
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: nil,
                          password: "Catn1pTime",
                          password_confirmation: "Catn1pTime")
      #Expect the user to not be valid with an error
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to be_present
    end


    it "displays an error if the password is missing" do
      #Create an example user with no password
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: nil,
                          password_confirmation: "Catn1pTime")
      #Expect the user to not be valid with an error
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to be_present
    end

    it "displays an error if the password confirmation is missing" do
      #Create an example user with no password confirmation
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: "Catn1pTime",
                          password_confirmation: nil)
      #Expect the user to not be valid with an error
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to be_present
    end

    it "displays an error if the email is already taken, not case sensitive" do
      #Create example user 1
      @user1 = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: "Catn1pTime",
                          password_confirmation: "Catn1pTime")
      #Create example user 2 with same email as user 1 but uppercase
      @user2 = User.create(first_name: "David",
      last_name: "Hall",
      email: "MAI@STRIPEDTIGER.com",
      password: "F00Fighters",
      password_confirmation: "F00Fighters")
      #Expect user 1 to be valid, expect user 2 to not be valid with an error
      expect(@user1).to be_valid
      expect(@user2).to_not be_valid
      expect(@user2.errors.full_messages).to be_present
    end

    it "displays an error if the password is too short" do
      #Create an example user with a password that is less than 8 characters
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: "Catn1p",
                          password_confirmation: "Catn1p")
      #Expect the user to not be valid with an error
      expect(@user).to_not be_valid
      expect(@user.errors.full_messages).to be_present
    end
  end

  describe '.authenticate_with_credentials' do

    it "should return a valid user if the user is authenticated" do
      #Create an example user
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: "mai@stripedtiger.com",
                          password: "Catn1pTime",
                          password_confirmation: "Catn1pTime")
      #User authentication method
      @returnedUser = User.authenticate_with_credentials(@user.email, @user.password)
      #Expect returned user to equal user
      expect(@returnedUser).to eq(@user)
    end

    it "should return a valid user if there is extra white space in email" do
      #Create an example user
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: " mai@stripedtiger.com ",
                          password: "Catn1pTime",
                          password_confirmation: "Catn1pTime")
      #Expect a valid user
      expect(@user).to be_valid
    end

    it "should return a valid user if there is are uppercase characters in email" do
      #Create an example user
      @user = User.create(first_name: "Mai",
                          last_name: "Hall",
                          email: " MAI@StripedTiger.com ",
                          password: "Catn1pTime",
                          password_confirmation: "Catn1pTime")
      #Expect a valid user
      expect(@user).to be_valid
    end
  end
end
