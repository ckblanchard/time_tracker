class RemoveInvoiceDateFromInvoices < ActiveRecord::Migration
  def change
    remove_column :invoices, :invoice_date
  end
end
