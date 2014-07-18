class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :contact_name
      t.string :company
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :phone_number
      t.integer :user_id

      t.timestamps
    end
  end
end
