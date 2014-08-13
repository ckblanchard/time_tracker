require 'spec_helper'

describe Topic do
  # let(:entry) { FactoryGirl.create(:entry) }
  
  context "has associations like" do
    it "have many entries" do
      t = Topic.reflect_on_association(:entries)
      expect(t.macro).to eq(:has_many)
    end
  end
end
