class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @invoices = current_user.invoices
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @invoice = current_user.invoices.new(invoice_params)

    if @invoice.save
      redirect_to invoices_path, notice: "Invoice successfully created."
    else
      render action: 'new', alert: "There was a problem creating your invoice. Please try again."
    end
  end

  private

    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:invoice_date, :status, :job_id)
    end
end
