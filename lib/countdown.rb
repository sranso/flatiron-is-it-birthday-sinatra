# this is basically my 'notes' file for the countdown logic.
# i added this logic to holiday.rb
attr_reader :days_until, :hrs_until, :mins_until, :secs_until

def next_bday_year
  if Time.now.month <= 10
    Time.now.year
  else
    Time.now.year + 1 
  end
end

def countdown
  time_diff = (Time.now - Time.local(next_bday_year, "Oct", 3)).to_i.abs
  # 86400 = seconds in day
  @days_until = time_diff/86400
  remainder = time_diff%86400
  # 3600 secs in hour
  @hrs_until = remainder/3600
  remainder = remainder%3600
  # 60 secs in min
  @mins_until = remainder/60
  @secs_until = remainder%60
end