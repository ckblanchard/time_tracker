require 'spec_helper'

describe InvoiceBuilderService do
  let(:invoice) { FactoryGirl.create(:invoice) }
  let(:builder) { InvoiceBuilderService.new(invoice) }
  let!(:topic) { FactoryGirl.create(:topic) }
  let(:params) { 
    {entry_date: Date.today, 
      start_time: Time.now, 
      end_time: (Time.now + 1.hour), 
      user_id: 1, 
      invoice_id: invoice.id,
      topic: topic} }
  let!(:entry1) { Entry.create(params) }
  let!(:entry2) { Entry.create(params) }
  
  context "with an invoice" do
    it "has a valid invoice" do
      expect(invoice).to be_valid
    end

    it "has an invoice with 2 entries" do
      expect(invoice.entries.length).to eq 2
    end
  end

  context "initialization" do
    it "has a new instance of an Invoice Builder Service" do  
      expect(builder).to be_a(InvoiceBuilderService)
    end

    it "has an instance of an invoice" do
      expect(builder.invoice).to eq invoice
    end
  end

  context "accessing invoice attributes" do
    it "can access invoice date" do
      expect(builder.invoice.invoice_date).to eq(invoice.invoice_date)
    end

    it "can access invoice's entries" do
      expect(builder.invoice.entries.first).to eq(entry1)
    end

    it "can access topics belonging to the invoice's entries" do
      expect(builder.invoice.entries.first.topic).to eq(topic)
    end
  end

end