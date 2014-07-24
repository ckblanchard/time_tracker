require 'spec_helper'

describe Entry do
  let(:entry) { FactoryGirl.create(:entry) }

  context "has associations like" do
    it "should belong to a user" do
      t = Entry.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it "should belong to an invoice" do
      t = Entry.reflect_on_association(:invoice)
      expect(t.macro).to eq(:belongs_to)
    end
  end

  context "status" do
    it "defaults to 'unattached' upon creation" do
      expect(entry.status).to eq("unattached")
    end

    it "is not 'finished' upon creation" do
      expect(entry.status).not_to eq("finished")
    end

    it "is not 'attached' upon creation" do
      expect(entry.status).not_to eq("attached")
    end

    it "changes to 'finished' when end time is logged" do
      entry = Entry.create(entry_date: Date.today, start_time: Time.now, user_id: 1)
      entry.update_attribute(:end_time, (Time.now + 1.hour))
      expect(entry.status).to eq("finished")
    end

    it "cannot be changed to 'finished' without an end time"
    it "can be changed to 'attached' if has a total time"
    it "cannot be changed to 'attached' without a total time"
  end

  context "with valid attributes" do
    it "is valid with a user" do
      expect(entry).to be_valid
    end

    it "is valid without an invoice" do
      entry.invoice_id = nil
      expect(entry).to be_valid
    end
  end

  context "with invalid attributes" do
    it "is invalid without a user" do
      entry.user_id = nil
      expect(entry).not_to be_valid
    end

    it "is invalid without a date" do
      entry.entry_date = nil
      expect(entry).not_to be_valid
    end

    it "is invalid without a start time" do
      entry.start_time = nil
      expect(entry).not_to be_valid
    end

    it "cannot be attached to an invoice without a 'finished' status"
    it "cannot be attached to an invoice without a total time"
  end

  context "#calculate_total_time" do
    before :each do
      @entry = entry
    end

    it "computes and saves total_time" do
      @entry.calculate_total_time
      expect(@entry.total_time).not_to eq(nil)
    end

    it "creates a BigDecimal object" do
      @entry.calculate_total_time
      expect(@entry.total_time.class).to eq(BigDecimal)
    end

    it "saves and returns a decimal object from the database" do
      @entry.calculate_total_time
      @entry.reload
      expect(@entry.total_time.class).to eq(BigDecimal)
    end

    it "changes entry.status to 'finished'" do
      @entry.calculate_total_time
      @entry.reload
      expect(@entry.status).to eq("finished")
    end
  end 

end
