class Invoice < ActiveRecord::Base
  enum status: [:active, :submitted, :paid]

  belongs_to :job
  has_many :entries

  validates :invoice_date, :status, presence: true

  monetize :total_cents

  def self.invoices_for(current_user)
    current_user.invoices.map { |i| ["#{i.job.job_name}: #{i.invoice_date}", i.id]  }
  end
end
