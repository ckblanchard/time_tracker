require 'spec_helper'

describe InvoicesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:client) { FactoryGirl.create(:client, user: user) }
  let(:job) { FactoryGirl.create(:job, client: client) }
  let(:invoice) { FactoryGirl.create(:invoice, job: job) }
  let(:invalid_invoice) { FactoryGirl.create(:invalid_invoice, job: job) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "populates an array of invoices" do
      get :index, job_id: job
      expect(assigns(:invoices)).to eq([invoice])
    end

    it "renders the :index view" do
      get :index, job_id: job
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested invoice to @invoice" do
      get :show, job_id: job, id: invoice
      expect(assigns(:invoice)).to eq(invoice)
    end

    it "renders the :show template" do
      get :show, job_id: job, id: invoice
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new invoice to @invoice" do
      get :new, job_id: job, id: invoice
      expect(assigns(:invoice)).to be_a_new(Invoice)
    end

    it "renders the :new template" do
      get :new, job_id: job, id: invoice
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns requested invoice to @invoice" do
      get :edit, job_id: job, id: invoice
      expect(assigns(:invoice)).to eq(invoice)
    end

    it "renders the :edit template" do
      get :edit, job_id: job, id: invoice
      expect(response).to render_template :edit
    end
  end

end
