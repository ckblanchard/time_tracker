require 'spec_helper'

describe User do

  context "associations" do
    it "has one profile" do
      t = User.reflect_on_association(:profile)
      expect(t.macro).to eq(:has_one)
    end

    it "has many clients" do
      t = User.reflect_on_association(:clients)
      expect(t.macro).to eq(:has_many)
    end
  end


  context "with valid attributes" do
    it "is valid with an email and password" do
      user = User.new(
        email: "example@example.com",
        password: "examplepassword")
      expect(user).to be_valid
    end
  end


  context "with invalid attributes" do
    it "is invalid without an email" do
      user = User.new(
        email: nil,
        password: "examplepassword")
      user.valid?
      expect(user.errors[:email].size).to eq(1)
    end

    it "is invalid without a password" do
      user = User.new(
        email: "example@example.com",
        password: nil)
      user.valid?
      expect(user.errors[:password].size).to eq(1)
    end

    it "is invalid with a duplicate email address" do
      User.create(
        email: "example@example.com",
        password: "password")
      user = User.new(
        email: "example@example.com",
        password: "password2")
      user.valid?
      expect(user.errors[:email].size).to eq(1)
    end
  end


  it "is referenced by username if it exists" do
    user = User.create(
      email: "john@example.com",
      password: "examplepassword",
      username: "ckblanc")
    expect(user.name).to eq("ckblanc")
  end

  it "is referenced by email if no username exists" do
    user = User.create(
      email: "john@example.com",
      password: "examplepassword")
    expect(user.name).to eq("john@example.com")
  end


  describe ".find_or_create_from_twitter" do
    let(:omniauth_hash) do
      OmniAuth::AuthHash.new(provider: "twitter", uid: "123545", info: {
        nickname: "Craiger"
      })
    end

    context "when the user does not exist" do
      it "creates a user with the omniauth hash" do
        user = User.find_or_create_from_twitter(omniauth_hash)
        expect(user.provider).to eq "twitter"
        expect(user.uid).to eq "123545"
        expect(user).to be_persisted
      end
    end

    context "when the user does exist" do
      let!(:user) { FactoryGirl.create(:user, uid: omniauth_hash.uid, provider: omniauth_hash.provider) }

      it "returns that user" do
        expect(User.find_or_create_from_twitter(omniauth_hash)).to eq(user)
      end
    end

  end


###### REFACTOR THIS CRAP BELOW
  context "signs up" do
    it "creates a blank profile" do
      user = User.create(
        email: "john@example.com",
        password: "examplepassword",
        username: "ckblanc")
      expect(user.profile.id).to eq(user.id)
      expect(user.profile.name).to eq("")
      expect(user.profile.address).to eq("")
      expect(user.profile.address2).to eq("")
      expect(user.profile.city).to eq("")
      expect(user.profile.state).to eq("")
      expect(user.profile.zip_code).to eq("")
      expect(user.profile.phone_number).to eq("")
    end

    it "responds to profile actions" do
      user = User.create(
        email: "john@example.com",
        password: "examplepassword",
        username: "ckblanc")
      expect(user.profile).to respond_to(:name)
      expect(user.profile).to respond_to(:address)
      expect(user.profile).to respond_to(:address2)
      expect(user.profile).to respond_to(:city)
      expect(user.profile).to respond_to(:state)
      expect(user.profile).to respond_to(:zip_code)
      expect(user.profile).to respond_to(:phone_number)
    end
  end

  context "responds to delegated profile methods" do
    it "calls delegated profile methods" do
      user = User.create(
        email: "john@example.com",
        password: "examplepassword",
        username: "ckblanc")
      user.profile.name = "John Doe"
      user.profile.city = "San Francisco"
      user.profile.state = "CA"
      user.profile.phone_number = "415-555-1234"

      expect(user.name).to eq("John Doe")
      expect(user.city).to eq("San Francisco")
      expect(user.state).to eq("CA")
      expect(user.phone_number).to eq("415-555-1234")
      expect { user.address }.to raise_error(NoMethodError)
    end
  end
end
