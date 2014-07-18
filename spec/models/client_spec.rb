require 'spec_helper'

describe Client do
  let(:client) { FactoryGirl.create(:client) }

  it "should belong to a user" do
    t = Client.reflect_on_association(:user)
    expect(t.macro).to eq(:belongs_to)
  end

  it "is valid with all fields filled" do
    expect(client).to be_valid
  end

  it "is still valid without a contact name" do
    client.contact_name = nil
    expect(client).to be_valid
  end

  it "is invalid without a company name" do
    client.company = nil
    expect(client).not_to be_valid
  end

  it "is invalid without an address" do
    client.address = nil 
    expect(client).not_to be_valid
  end

  it "is invalid without a city" do
    client.city = nil
    expect(client).not_to be_valid
  end

  it "is invalid without a state" do
    client.state = nil
    expect(client).not_to be_valid
  end

  it "is invalid without a two-letter postal state code" do
    client.state = "Cal"
    expect(client).not_to be_valid
  end

  it "is valid with a two-letter postal state code" do
    expect(client).to be_valid
  end

  it "is invalid without valid zip code" do
    client.zip_code = nil
    expect(client).not_to be_valid
  end

  it "is invalid without a numeric zip code" do
    client.zip_code = "94!02"
    expect(client).not_to be_valid
  end

  it "is valid without a phone number" do
    client.phone_number = nil
    expect(client).to be_valid
  end

  it "is invalid without a numeric phone number" do
    client.phone_number = "415abc1234"
    expect(client).not_to be_valid
  end

  it "is invalid without a 10-digit phone number" do
    client.phone_number = "555-1234"
    expect(client).not_to be_valid
  end

  it "is valid with dashes" do
    client.phone_number = "415-555-1234"
    expect(client).to be_valid
  end

  it "is valid without dashes" do
    client.phone_number = "4155551234"
    expect(client).to be_valid
  end
end