require 'spec_helper'

describe InvoicesController do
  let(:user) { FactoryGirl.create(:user) }
  let(:invoice) { FactoryGirl.create(:invoice) }
  let(:invalid_invoice) { FactoryGirl.create(:invalid_invoice) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "populates an array of invoices" do
      get :index
      expect(assigns(:invoices)).to eq([invoice])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested invoice to @invoice" do
      get :show, id: invoice
      expect(assigns(:invoice)).to eq(invoice)
    end

    it "renders the :show template" do
      get :show, id: invoice
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new invoice to @invoice" do
      get :new
      expect(assigns(:invoice)).to be_a_new(Invoice)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns requested invoice to @invoice" do
      get :edit, id: invoice
      expect(assigns(:invoice)).to eq(invoice)
    end

    it "renders the :edit template" do
      get :edit, id: invoice
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new invoice in the database" do
        expect { post :create, invoice: attributes_for(:invoice) }.to change(Invoice, :count).by(1)
      end

      it "redirects to the show for that invoice" do
        post :create, invoice: attributes_for(:invoice)
        expect(response).to redirect_to invoices_path
      end
    end

    # context "with invalid attributes" do
    #   it "does not save the new invoice to the database" do
    #     expect { post :create, invoice: attributes_for(:invalid_invoice) }.to_not change(Invoice, :count)
    #   end

    #   it "re-renders the :new template" do
    #     post :create, invoice: attributes_for(:invalid_invoice)
    #     expect(response).to render_template :new
    #   end
    # end
  end

  # describe "PUT #update" do
  #   before :each do
  #     @client = create(:lindsay)
  #   end

  #   it "locates the requested client" do
  #     put :update, id: @client, client: attributes_for(:client)
  #     expect(assigns(:client)).to eq(@client)
  #   end

  #   context "with valid attributes" do
  #     it "updates @client's attributes" do
  #       put :update, id: @client, client: attributes_for(:client, company: "Habitat for Humanity")
  #       @client.reload
  #       expect(@client.company).to eq("Habitat for Humanity")
  #     end

  #     it "redirects to the show for that client" do
  #       put :update, id: @client, client: attributes_for(:client)
  #       expect(response).to redirect_to @client
  #     end
  #   end

  #   context "with invalid attributes" do
  #     it "does not update the client to the database" do
  #       put :update, id: @client, client: attributes_for(:client, company: nil)
  #       @client.reload
  #       expect(@client.company).to_not eq(nil)
  #     end

  #     it "re-renders the :edit template" do
  #       put :update, id: @client, client: attributes_for(:invalid_client)
  #       expect(response).to render_template :edit
  #     end
  #   end
  # end

  # describe "DELETE #destroy" do
  #   before :each do
  #     @client = client
  #   end

  #   it "deletes the client from the database" do
  #     expect { delete :destroy, id: @client }.to change(Client, :count).by(-1)
  #   end

  #   it "redirects to the :index view" do
  #     delete :destroy, id: @client
  #     expect(response).to redirect_to clients_path
  #   end
  # end

end
