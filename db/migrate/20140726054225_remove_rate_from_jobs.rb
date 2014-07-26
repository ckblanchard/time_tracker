class RemoveRateFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :rate
  end
end
