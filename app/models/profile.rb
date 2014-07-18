class Profile < ActiveRecord::Base
  belongs_to :user

  validates :zip_code, numericality: { only_integer: true }, allow_blank: true
  validates :phone_number, format: { with: /\A[+]?\d+\Z/, message: "Invalid phone number."}, allow_blank: true
  validates_with StateValidator, allow_blank: true

end
