class Entry < ActiveRecord::Base
  enum status: ["unattached", "finished", "attached"]

  belongs_to :user
  belongs_to :invoice

  monetize :subtotal_cents, allow_nil: true

  validates :user_id, :entry_date, :start_time, presence: true

  after_create :check_end_time

  def check_end_time
    return unless self.end_time?
    calculate_total_time unless self.total_time?
  end

  def calculate_total_time
    self.total_time = convert_to_hours(self.end_time - self.start_time)
    calculate_subtotal
    self.finished!
  end

  def convert_to_hours(seconds)
    (seconds.to_d / 3600)
  end

  def calculate_subtotal
    rate = self.invoice.job.rate
    self.subtotal = Money.new(self.total_time * rate)
  end

  # Figure out how to override the finished! enum method
  # def finished!
  #   if self.end_time?
  #     super
  #   else
  #     raise
  #   end
  # end
end
