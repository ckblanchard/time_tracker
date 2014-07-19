require 'spec_helper'

describe Profile do
  let!(:profile) { FactoryGirl.create(:profile) }

  it "has a valid factory" do
    expect(profile).to be_valid
  end

  it "should belong to a user" do
    t = Profile.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  it "responds to profile attribute methods" do
    expect(profile).to respond_to(:name)
    expect(profile).to respond_to(:address)
    expect(profile).to respond_to(:address2)
    expect(profile).to respond_to(:city)
    expect(profile).to respond_to(:state)
    expect(profile).to respond_to(:zip_code)
    expect(profile).to respond_to(:phone_number)
  end
end
