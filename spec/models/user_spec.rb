require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "should be valid with valid attributes" do
      user = User.new(email: "email@email.com", password: "password", password_confirmation: "password", name: "bob", last_name: "evans")
      expect(user).to be_valid
      end
    it "should receive input from password field" do
      user = User.new(email: "email@email.com", password: nil, password_confirmation: "password", name: "bob", last_name: "evans")
      expect(user).to_not be_valid
    end
    it "should receive input from password_confirmation field" do
      user = User.new(email: "email@email.com", password: "password", password_confirmation: nil, name: "bob", last_name: "evans")
      expect(user).to_not be_valid
    end
    it "should have a password and password_confirmation that match" do
      user = User.new(email: "email@email.com", password: "password", password_confirmation: "somethingelse", name: "bob", last_name: "evans")
      expect(user).to_not be_valid
    end
    it "should have a unique email and not case sensitive" do
      emailArray = User.all.pluck(:email)
      user1 = User.new(email: "email@email.com", password: "password", password_confirmation: "password", name: "bob", last_name: "evans")
      user2 = User.new(email: "Email@email.com", password: "password", password_confirmation: "password", name: "bob", last_name: "evans")
      user1.save
      user2.save
      expect(user2).to_not be_valid
    end
    it "should have a first name" do
      user = User.new(email: "email@email.com", password: "password", password_confirmation: "password", name: nil, last_name: "evans")
      expect(user).to_not be_valid
    end
    it "should have a last name" do
      user = User.new(email: "email@email.com", password: "password", password_confirmation: "password", name: "bob", last_name: nil)
      expect(user).to_not be_valid
    end
    it "passwords should be at least 5 characters" do
      user = User.new(email: "email@email.com", password: "pass", password_confirmation: "pass", name: "bob", last_name: "evans")
      expect(user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
  it "password should match username" do
    user = User.new(email: "email@email.com", password: "password", password_confirmation: "password", name: "bob", last_name: "evans")
    expect(user.authenticate("miscellaneous")).to eq(false)
  end

  it "user should be able to log in with space before and after email" do
    user = User.new(email: "email@email.com", password: "password", password_confirmation: "password", name: "bob", last_name: "evans")
    expect(User.authenticate_with_credentials("    email@email.com", "password")).to eq(user)
end
end
end



