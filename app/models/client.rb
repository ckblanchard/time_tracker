class Client < ActiveRecord::Base
  belongs_to :user

  validates :company, :address, :city, presence: true
  validates :zip_code, numericality: { only_integer: true }, length: { is: 5 }
  # validates :zip_code, format: { with: /\A\d{5}\z/ }
  # validates :phone_number, format: { with: /\A\(?\d{3}(\)?\p{Pd}?.?)\d{3}\p{Pd}?\d{4}/, message: "Please enter a valid phone number with or without dashes." }, allow_blank: true
  # validates :phone_number, phone_number: { ten_digits: true, allow_blank: true, message: "Please enter a valid phone number, including area code." }
  validates :phone_number, format: { with: /\A\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\z/, message: "Please enter a valid phone number with area code."}, allow_blank: true
  validates_with StateValidator
end
