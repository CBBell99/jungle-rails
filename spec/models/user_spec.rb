require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do  

    it "should save a user when all fields are entered" do
      @user = User.new(first_name: "Naruto", last_name: "Uzumaki", email:"naruto@example.com", password: "password", password_confirmation:"password")
      expect(@user).to be_valid
    end

    it "should not save if first_name is empty" do
      @user = User.new(first_name: nil, last_name: "Uzumaki", email:"naruto@example.com", password: "password", password_confirmation:"password")
      expect(@user).to be_invalid
    end
  
    it "should not save if last_name is empty" do
      @user = User.new(first_name: "Naruto", last_name: nil, email:"naruto@example.com", password: "password", password_confirmation:"password")
      expect(@user).to be_invalid
    end
    
    it "should not save if email is empty" do
      @user = User.new(first_name: "Naruto", last_name: "Uzumaki", email: nil, password: "password", password_confirmation:"password")
      expect(@user).to be_invalid
    end
   
    it "should not save if password is empty" do
      @user = User.new(first_name: "Naruto", last_name: "Uzumaki", email: "naruto@example.com", password: nil, password_confirmation:"password")
      expect(@user).to be_invalid
    end

    it "should not save if password_confirmation is empty" do
      @user = User.new(first_name: "Naruto", last_name: "Uzumaki", email: "naruto@example.com", password: 'password', password_confirmation: nil)
      expect(@user).to be_invalid
    end
    
    it "should not save if password is too short" do
      @user = User.new(first_name: "Naruto", last_name: "Uzumaki", email: "naruto@example.com", password: 'pa', password_confirmation: 'pa')
      expect(@user).to be_invalid
    end
    
    it "should not save if email is not unique" do
      @user1 = User.new(first_name: "Naruto", last_name: "Uzumaki", email: "naruto@example.com", password: 'password', password_confirmation: 'password')
      @user1.save
    
      @user2 = User.new(first_name: "Naruto", last_name: "Uzumaki", email: "naruto@example.com", password: 'password', password_confirmation: 'password')
      expect(@user2).to be_invalid
    end

     describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

  end  
end