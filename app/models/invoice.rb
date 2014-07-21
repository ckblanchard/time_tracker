class Invoice < ActiveRecord::Base
  enum status: [:active, :submitted, :paid]

  belongs_to :job

  validates :invoice_date, :status, presence: true
end
