class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_name
      t.datetime :start_date
      t.datetime :end_date
      t.decimal :rate
      t.references :client, index: true

      t.timestamps
    end
  end
end
