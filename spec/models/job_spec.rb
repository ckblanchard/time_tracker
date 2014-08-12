require 'spec_helper'

describe Job do
  include MoneyRails::TestHelpers
  let(:job) { FactoryGirl.create(:job) }

  context "has associations like" do
    it "belongs to a client" do
      t = Job.reflect_on_association(:client)
      expect(t.macro).to eq(:belongs_to)
    end

    it "has many invoices" do
      t = Job.reflect_on_association(:invoices)
      expect(t.macro).to eq(:has_many)
    end
  end

  context "with valid attributes" do
    it "is valid with a job name" do
      expect(job).to be_valid
    end

    it "is valid with a start date" do
      expect(job).to be_valid
    end

    it "is valid with an end date" do
      expect(job).to be_valid
    end

    it "is valid with a rate" do
      expect(job).to be_valid
    end
  end

  context "with invalid attributes" do
    it "is invalid without a job name" do
      job.job_name = nil
      expect(job).not_to be_valid
    end

    it "is invalid without a start date" do
      job.start_date = nil
      expect(job).not_to be_valid
    end

    it "is invalid without an end date" do
      job.end_date = nil
      expect(job).not_to be_valid
    end

    it "is invalid with an end date in the past" do
      job = Job.create(job_name: "Name", start_date: Date.today, end_date: 2.weeks.ago, rate: 9.99, client_id: 2)
      expect(job).not_to be_valid
    end

    it "is invalid without a rate" do
      job.rate_cents = nil
      job.save
      expect(job).not_to be_valid
    end
  end

  context "with money" do
    it "has a money value for rate" do
      expect(monetize(:rate_cents)).to be_truthy
    end
  end
end
