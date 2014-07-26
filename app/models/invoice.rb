class Invoice < ActiveRecord::Base
  enum status: [:active, :submitted, :paid]

  belongs_to :job
  has_many :entries

  validates :invoice_date, :status, presence: true
end
