require 'spec_helper'

describe User do
  # pending "add some examples to (or delete) #{__FILE__}"

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
        expect(User.find_or_create_from_twitter(omniauth_hash).to eq(user))
      end
    end

  end
end
