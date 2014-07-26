class AddRateToJobs < ActiveRecord::Migration
  def change
    add_money :jobs, :rate
  end
end
