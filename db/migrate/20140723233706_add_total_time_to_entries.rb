class AddTotalTimeToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :total_time, :decimal, precision: 5, scale: 2
  end
end
