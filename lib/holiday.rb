class Holiday
  attr_reader :time

  Timezone::Configure.begin do |c|
    c.username = 'your_geonames_username_goes_here'
  end

  def initialize(time)
    @this_month = time.month
    @this_day = time.day
    @this_year = time.year
  end

  def birthday
    @bday_month = 10
    @bday_day = 03
    @bday_year = 1988
    yes_or_no_bday(@bday_month, @bday_day)
  end

  def yes_or_no_bday(month, day)
    if @this_month == month && @this_day == day
      "Yes! She just turned #{age} years old!!!"
    else
      countdown
    end
  end

  def age
    @this_year - @bday_year
  end

  def next_bday_year
    if @this_month <= 10
      @this_year
    else
      @this_year + 1 
    end
  end

  def countdown
    time_diff = (Time.now - Time.local(next_bday_year, "Oct", 3)).to_i.abs
    # 86400 = seconds in day
    days_until = time_diff/86400
    remainder = time_diff%86400
    # 3600 secs in hour
    hrs_until = remainder/3600
    remainder = remainder%3600
    # 60 secs in min
    mins_until = remainder/60
    secs_until = remainder%60
    "No, but it will be in #{days_until} days, #{hrs_until} hours,
     #{mins_until} minutes, and #{secs_until} seconds!"
  end

  def christmas
    @christmas_month = 12
    @christmas_day = 25
    yes_or_no(@christmas_month, @christmas_day)
  end

  def hannukah
    @hannukah_month = 12
    @hannukah_day = 16..24
    yes_or_no(@hannukah_month, @hannukah_day)
  end

  def yes_or_no(month, day)
    if @this_month == month && day === @this_day
      "Yes!"
    else
      "No."
    end
  end

end