require 'spec_helper'

describe Entry do
  let(:entry) { FactoryGirl.create(:entry) }
  let(:user) { FactoryGirl.create(:user) }
  let(:invoice) { FactoryGirl.create(:invoice) }

  context "has associations like" do
    it "should belong to a user"
    it "should belong to an invoice"
  end

  context "status" do
    it "defaults to 'unattached' upon creation"
    it "changes to 'finished' when end time is logged"
    it "cannot be changed to 'finished' without an end time"
    it "can be changed to 'attached' if has a total time"
    it "cannot be changed to 'attached' without a total time"
  end

  context "with valid attributes" do
    it "is valid with a user"
    it "is valid without an invoice"
    it "is valid with a start time"
    it "is valid with an end time"
    it "has a valid status when 'unattached'"
    it "has a valid status when 'finished'"
    it "has a valid status when 'attached'"
  end

  context "with invalid attributes" do
    it "is invalid without a user"
    it "is invalid without a start time"
    it "cannot be attached to an invoice without a finished status"

  end

end
