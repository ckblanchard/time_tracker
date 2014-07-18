class Profile < ActiveRecord::Base
  belongs_to :user

  validates :zip_code, numericality: { only_integer: true }, allow_blank: true
  # validates :phone_number, format: { with: /\A[+]?\d+[-]\Z/, message: "Please enter a phone number without dashes"}, allow_blank: true
  validates :phone_number, format: { with: /\A\d{3}\p{Pd}?\d{3}\p{Pd}?\d{4}/, message: "Please enter a valid phone number with or without dashes." }, allow_blank: true
  validates_with StateValidator, allow_blank: true

end
