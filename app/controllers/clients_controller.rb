class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @clients = current_user.clients
  end

  def show
  end

  def new
    @client = Client.new
  end

  def edit
  end

  def create
    if @client.save
      # redirect_to clients_path, notice: "Client successfully created."
      redirect_to @client, notice: "Client successfully created."
    else
      render action: 'new', alert: "There was a problem creating your client. Please try again."
    end
  end

  def update
    if @client.update(client_params)
      redirect_to @client, notice: "Client successfully updated."
    else
      render action: 'edit', alert: "There was a problem updating your client. Please try again."
    end
  end

  def destroy
    if @client.destroy
      redirect_to clients_path, notice: "Your client has been deleted."
    else
      redirect_to @client, alert: "There was a problem deleting your client. Please try again."
    end
  end

  private

    def set_client
      @client = Client.find(params[:id])
    end

    def client_params
      params.require(:client)
        .permit(:contact_name, :company, :address, :address2, 
          :city, :state, :zip_code, :phone_number)
    end
end
