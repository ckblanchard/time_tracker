class Job < ActiveRecord::Base
  include Filterable

  belongs_to :client
  has_many :invoices
  has_many :entries, through: :invoices

  monetize :rate_cents

  validates :job_name, :start_date, :end_date, :rate, presence: true
  validate :end_date_cannot_be_in_the_past, on: :create

  scope :client, -> (client_id) { where client_id: client_id }

  private

    def end_date_cannot_be_in_the_past
      if end_date.present? && end_date < Date.today
        errors.add :end_date, "can't be in the past"
      end
    end
end
