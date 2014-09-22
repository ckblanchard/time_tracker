module Api
  module V1
    class InvoicesController < ApplicationController
      before_action :set_invoice, only: [:show, :edit, :update]
      before_action :authenticate_user!

      def index
        @job = current_user.jobs.find(params[:job_id])
        @invoices = @job.invoices
        render json: @invoices
      end

      def show
        render json: @invoice
      end

      def new
        @job = current_user.jobs.find(params[:job_id])
        @invoice = Invoice.new
      end

      def edit
      end

      def create
        @job = current_user.jobs.find(params[:job_id])
        @invoice = @job.invoices.new(invoice_params)

        if @invoice.save
          render json: @invoice, status: :created, location: @invoice
        else
          render json: @invoice.errors, status: :unprocessable_entity
        end
      end

      def update
        if @invoice.update(invoice_params)
          head :no_content
        else
          render json: @invoice.errors, status: :unprocessable_entity
        end
      end

      private

        def set_invoice
          @job = current_user.jobs.find(params[:job_id])
          @invoice = @job.invoices.find(params[:id])
        end

        def invoice_params(params)
          params.require(:invoice).permit(
            :invoice_date, :status, :job_id, :total)
        end

    end
  end
end