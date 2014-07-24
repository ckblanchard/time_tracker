class RemoveEntriesTotalTime < ActiveRecord::Migration
  def change
    remove_column :entries, :total_time, :time
  end
end
