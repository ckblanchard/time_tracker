class AddTotalToInvoices < ActiveRecord::Migration
  def change
    add_money :invoices, :total
  end
end
