class Entry < ActiveRecord::Base
  enum status: ["unattached", "finished", "attached"]

  belongs_to :user
  belongs_to :invoice

  validates :user_id, :entry_date, :start_time, presence: true

  after_update :check_end_time, on: :update

  def check_end_time
    calculate_total_time unless self.total_time?
  end

  def calculate_total_time
    self.total_time = convert_to_hours(self.end_time - self.start_time)
    self.finished!
  end

  def convert_to_hours(seconds)
    (seconds.to_d / 3600)
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
