class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.datetime :invoice_date
      t.integer :status, default: 0
      t.references :job, index: true

      t.timestamps
    end
  end
end
