require 'spec_helper'

describe Invoice do
  let(:invoice) { FactoryGirl.create(:invoice) }

  context "has associations like" do
    it "belongs to a job" do
      t = Invoice.reflect_on_association(:job)
      expect(t.macro).to eq(:belongs_to)
    end

    it "has many entries"
  end

  context "with valid attributes" do
    it "has a valid invoice date" do
      expect(invoice).to be_valid
    end

    it "has a valid status when active" do
      invoice.status = 0
      expect(invoice).to be_valid
    end

    it "has a valid status when submitted" do
      invoice.status = 1
      expect(invoice).to be_valid
    end

    it "has a valid status when paid" do
      invoice.status = 2
      expect(invoice).to be_valid
    end
  end

  context "with invalid attributes" do
    it "is invalid without an invoice date" do
      invoice.invoice_date = nil
      expect(invoice).not_to be_valid
    end

    it "is invalid without a status" do
      invoice.status = nil
      expect(invoice).not_to be_valid
    end

    it "is invalid with an unknown status number" do
      expect { invoice.status = 500 }.to raise_error(ArgumentError)
    end
  end

# expect { Lead.new.stale! }.to raise_error(ActiveRecord::RecordInvalid)

  context "with enum" do
    it "is active by default" do
      newInvoice = Invoice.new
      expect(newInvoice.status).to eq("active")
    end

    it "is not submitted by default" do
      newInvoice = Invoice.new
      expect(newInvoice.status).not_to eq("submitted")
    end

    it "is not paid by default" do
      newInvoice = Invoice.new
      expect(newInvoice.status).not_to eq("paid")
    end

    it "is submitted when #submitted! is called" do
      invoice.submitted!
      expect(invoice.status).to eq("submitted")
    end

    it "is paid when #paid! is called" do
      invoice.paid!
      expect(invoice.status).to eq("paid")
    end
  end

end


# validation sample
# expect { Lead.new.stale! }.to raise_error(ActiveRecord::RecordInvalid, "Validation failed: Value invalid for new leads")