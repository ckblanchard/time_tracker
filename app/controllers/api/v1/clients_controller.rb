module Api
  module V1
    class ClientsController < ApplicationController
      before_action :set_client, only: [:show, :edit, :update]
      before_action :authenticate_user!

      def index
        @clients = current_user.clients
        render json: @clients
      end

      def show
        render json: @client
      end

      def new
        @client = Client.new
      end

      def edit
      end

      def create
        @client = current_user.clients.new(client_params)

        if @client.save
          render json: @client, status: :created, location: @client
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      def update
        if @client.update(client_params)
          head :no_content
        else
          render json: @client.errors, status: :unprocessable_entity
        end
      end

      private

        def set_client
          @client = current_user.clients.find(params[:id])
        end

        def client_params(params)
          params.require(:client).permit(
            :contact_name, :company, :address, :address2, 
            :city, :state, :zip_code, :phone_number)
        end

    end
  end
end