class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]
  before_action :set_select_statuses, only: [:new, :edit]
  before_action :authenticate_user!

  def index
    @job = current_user.jobs.find(params[:job_id])
    @invoices = @job.invoices
  end

  def show
  end

  def new
    @job = current_user.jobs.find(params[:job_id])
    # @invoice = @job.invoices.new
    @invoice = Invoice.new
  end

  def edit
  end

  def create
    @job = current_user.jobs.find(params[:job_id])
    # @invoice = @job.invoices.create(params(invoice_params))
    @invoice = @job.invoices.new(invoice_params)

    if @invoice.save
      redirect_to job_invoices_path, notice: "Invoice successfully created."
    else
      render action: 'new', alert: "There was a problem creating your invoice. Please try again."
    end
  end

  def update
    @statuses = Invoice.statuses

    if @invoice.update(invoice_params)
      redirect_to @invoice, notice: "Invoice successfully updated."
    else
      render action: 'edit', alert: "There was a problem updating your invoice. Please try again."
    end
  end

  def destroy
    if @invoice.destroy
      redirect_to job_invoices_path, notice: "Invoice has been deleted."
    else
      redirect_to @invoice, alert: "There was a problem deleting your invoice. Please try again."
    end
  end

  private

    def set_invoice
      @job = current_user.jobs.find(params[:job_id])
      @invoice = @job.invoices.find(params[:id])
    end

    def set_select_statuses
    @statuses = Invoice.statuses
    end

    def invoice_params
      params.require(:invoice).permit(:invoice_date, :status, :job_id)
    end
end
