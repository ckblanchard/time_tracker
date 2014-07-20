class Job < ActiveRecord::Base
  belongs_to :client

  validates :job_name, :start_date, :end_date, :rate, presence: true
  validate :end_date_cannot_be_in_the_past, on: :create

  private

    def end_date_cannot_be_in_the_past
      if end_date < Date.today
        errors.add :end_date, "can't be in the past"
      end
    end
end
