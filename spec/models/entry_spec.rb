require 'spec_helper'

describe Entry do
  include MoneyRails::TestHelpers
  let(:user) { FactoryGirl.create(:user) }
  let(:client) { FactoryGirl.create(:client, user: user) }
  let(:job) { FactoryGirl.create(:job, client: client) }
  let(:invoice) { FactoryGirl.create(:invoice, job: job) }
  let(:entry) { FactoryGirl.create(:entry, invoice: invoice, user: user) }
  let(:unfinished_entry) { FactoryGirl.create(:unfinished_entry, invoice: invoice, user: user) }

  context "has associations like" do
    it "should belong to a user" do
      t = Entry.reflect_on_association(:user)
      expect(t.macro).to eq(:belongs_to)
    end

    it "should belong to an invoice" do
      t = Entry.reflect_on_association(:invoice)
      expect(t.macro).to eq(:belongs_to)
    end

    it "should belong to a topic" do
      t = Entry.reflect_on_association(:topic)
      expect(t.macro).to eq(:belongs_to)
    end
  end

  context "with money" do
    it "has a money value for subtotal" do
      expect(monetize(:subtotal_cents)).to be_truthy
    end

    it "accepts nil values, for before subtotal is calculated" do
      expect(monetize(:subtotal_cents).allow_nil).to be_truthy
    end
  end

  context "status" do

    it "defaults to 'unattached' upon creation" do
      new_entry = Entry.create(entry_date: Date.today, start_time: Time.now)
      expect(new_entry.status).to eq("unattached")
    end

    it "is not 'finished' upon creation" do
      new_entry = Entry.create(entry_date: Date.today, start_time: Time.now)
      expect(new_entry.status).not_to eq("finished")
    end

    it "is not 'attached' upon creation" do
      new_entry = Entry.create(entry_date: Date.today, start_time: Time.now)
      expect(new_entry.status).not_to eq("attached")
    end

    it "changes to 'finished' when end time is logged" do
      unfinished_entry.end_time = Time.now + 1.hour
      unfinished_entry.save
      expect(unfinished_entry.status).to eq("finished")
    end

    it "cannot be changed to 'finished' without an end time"
    it "can be changed to 'attached' if has a total time"
    it "cannot be changed to 'attached' without a total time"

  end

  context "with valid attributes" do
    it "is valid with a user, invoice, entry date and start time" do
      new_entry = Entry.create(entry_date: Date.today, start_time: Time.now, user_id: 1, invoice_id: 1)
      expect(new_entry).to be_valid
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

    it "is invalid without an invoice" do
      entry.invoice_id = nil
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

  context "#calculate_subtotal" do
    it "should return a valid money amount" do
      entry = Entry.create(entry_date: Date.today, start_time: Time.now, end_time: (Time.now + 1.hour), user_id: 1, invoice: invoice)
      expect(entry.subtotal.class).to eq(Money)
    end
  end

end
