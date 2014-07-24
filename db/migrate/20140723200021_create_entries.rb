class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.date :entry_date
      t.time :start_time
      t.time :end_time
      t.time :total_time
      t.integer :status, default: 0
      t.integer :user_id
      t.integer :invoice_id

      t.timestamps
    end
  end
end
