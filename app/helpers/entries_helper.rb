module EntriesHelper
  def format_time(time)
    time.localtime.strftime("%r")
  end
end
