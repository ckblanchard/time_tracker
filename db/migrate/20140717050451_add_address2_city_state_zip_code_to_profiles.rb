class AddAddress2CityStateZipCodeToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :address2, :string
    add_column :profiles, :city, :string
    add_column :profiles, :state, :string
    add_column :profiles, :zip_code, :string
  end
end
