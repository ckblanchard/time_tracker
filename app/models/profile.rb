class Profile < ActiveRecord::Base
  belongs_to :user

  validates :zip_code, numericality: { only_integer: true }, allow_blank: true, length: { is: 5 }
  validates :phone_number, format: { with: /\A\(?([0-9]{3})\)?[-. ]?([0-9]{3})[-. ]?([0-9]{4})\z/, message: "Please enter a valid phone number with area code."}, allow_blank: true
  validates_with StateValidator, allow_blank: true

end
