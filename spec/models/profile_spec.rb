require 'spec_helper'

describe Profile do
  let(:profile) { FactoryGirl.create(:profile) }
  # let(:invalid_profile) { FactoryGirl.create(:invalid_profile) }

  it "has a valid factory" do
    expect(profile).to be_valid
  end

  it "should belong to a user" do
    t = Profile.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  context "with valid attributes" do
    it "has a valid name" do
      expect(profile).to be_valid
    end

    it "has a valid address" do
      expect(profile).to be_valid
    end

    it "has a valid secondary address" do
      expect(profile).to be_valid
    end

    it "has a valid city" do
      expect(profile).to be_valid
    end

    it "has a valid state" do
      expect(profile).to be_valid
    end

    it "has a valid zip code" do
      expect(profile).to be_valid
    end

    it "has a valid phone number" do
      expect(profile).to be_valid
    end
  end

  context "with invalid attributes" do
    it "is invalid without a valid zip code" do
      profile.zip_code = "9410"
      expect(profile).not_to be_valid
    end

    it "is invalid without a valid phone number" do
      profile.phone_number = "415-555-123"
      expect(profile).not_to be_valid
    end

    it "is invalid without a valid state" do
      profile.state = "Calif"
      expect(profile).not_to be_valid
    end
  end
end
