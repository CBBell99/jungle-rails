require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do  

    it "should save a user when all fields are entered" do
         @user = User.new(first_name: 'Naruto', last_name: 'Uzumaki',
        email:'n.uzumaki@example.com', password: 'password',
        password_confirmation: 'password'
      )
      expect(@user).to be_valid
    end

    it "should not save if first_name is empty" do
      @user = User.new(first_name: nil, last_name: "Uzumaki", email:'n.uzumaki@example.com', password: "password", password_confirmation:"password")
      expect(@user).to be_invalid
    end
  
    it "should not save if last_name is empty" do
      @user = User.new(first_name: "Naruto", last_name: nil, email:'n.uzumaki@example.com', password: "password", password_confirmation:"password")
      expect(@user).to be_invalid
    end
    
    it "should not save if email is empty" do
      @user = User.new(first_name: "Naruto", last_name: "Uzumaki", email: nil, password: "password", password_confirmation:"password")
      expect(@user).to be_invalid
    end
   
    it "should not save if password is empty" do
      @user = User.new(first_name: "Naruto", last_name: "Uzumaki", email: 'n.uzumaki@example.com', password: nil, password_confirmation:"password")
      expect(@user).to be_invalid
    end

    it "should not save if password_confirmation is empty" do
      @user = User.new(first_name: "Naruto", last_name: "Uzumaki", email: 'n.uzumaki@example.com', password: 'password', password_confirmation: nil)
      expect(@user).to be_invalid
    end
    
    it "should not save if password is too short" do
      @user = User.new(first_name: "Naruto", last_name: "Uzumaki", email: 'n.uzumaki@example.com', password: 'pa', password_confirmation: 'pa')
      expect(@user).to be_invalid
    end
    
    it "should not save if email is not unique" do
      @user1 = User.new(first_name: "Naruto", last_name: "Uzumaki", email: 'n.uzumaki@example.com', password: 'password', password_confirmation: 'password')
      @user1.save
    
      @user2 = User.new(first_name: "Naruto", last_name: "Uzumaki", email: 'n.uzumaki@example.com', password: 'password', password_confirmation: 'password')
      expect(@user2).to be_invalid
    end


  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'returns a user with valid params' do
      @user = User.new(first_name:"Naruto", last_name: "Uzumaki",
        email: "n.uzumaki@example.com", password: "password",
        password_confirmation: "password")
      @user.save
      @user = User.authenticate_with_credentials("n.uzumaki@example.com", "assword")
      expect(@user).not_to be(nil)
    end
    
    it 'Should not pass with incorrect password' do
      @user = User.new(first_name:"Naruto", last_name: "Uzumaki",
        email: "n.uzumaki@example.com", password: "password",
        password_confirmation: "password")
      @user.save
       @user = User.authenticate_with_credentials("n.uzumaki@example.com", "sword")
      expect(@user).to be(nil)
    end
    
    it 'returns a user with extra whitespace in email' do
      @user = User.new(first_name:"Naruto", last_name: "Uzumaki",
        email: "n.uzumaki@example.com", password: "password",
        password_confirmation: "password")
      @user.save
       @user = User.authenticate_with_credentials("   n.uzumaki@example.com", "password")
      expect(@user).not_to be(nil)
    end
    
    it 'returns a user with valid params and random caps' do
      @user = User.new(first_name:"Naruto", last_name: "Uzumaki",
        email: "n.uzumaki@example.com", password: "password",
        password_confirmation: "password")
      @user.save
       @user = User.authenticate_with_credentials("N.uzUmakI@exAmple.com", "password")
      expect(@user).not_to be(nil)
    end

    it 'Should fail if user is not registered' do
      @user = User.authenticate_with_credentials("n.uzumaki@example.com", "password")
      expect(@user).to be(nil)
    end

  

    end
  end  
end