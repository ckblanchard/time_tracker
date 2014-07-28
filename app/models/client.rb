class Client < ActiveRecord::Base
  belongs_to :user
  has_many :jobs
  has_many :invoices, through: :jobs

  validates :company, :address, :city, presence: true
  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }
  validates :phone_number, format: { with: /\A\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\z/, message: "Please enter a valid phone number with area code."}, allow_blank: true
  validates_with StateValidator
end
