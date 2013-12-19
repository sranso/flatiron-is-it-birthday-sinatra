class Holiday
  attr_reader :time

  Timezone::Configure.begin do |c|
    c.username = 'your_geonames_username_goes_here'
  end

  attr_accessor :really

  def initialize(time)
    @this_month = time.month
    @this_day = time.day
    @this_year = time.year
  end

  def birthday
    @bday_month = 10
    @bday_day = 03
    @bday_year = 1988
    yes_or_no(@bday_month, @bday_day)
  end

  def christmas
    @christmas_month = 12
    @christmas_day = 25
    yes_or_no(@christmas_month, @christmas_day)
  end

  def hannukah
    @hannukah_month = 11 #12
    @hannukah_day = 23 #(16..24)
    yes_or_no(@hannukah_month, @hannukah_day)
  end

  def yes_or_no(month, day)
    if @this_month == month && day === @this_day
      "Yes!"
    else
      "No."
    end
  end

  def age
    @this_year - @bday_year
  end

  def months_until_birthday
    if (@this_month - @bday_month) >= 0
      @months_until_birthday = 12 - (@this_month - @bday_month)       
    else
      @months_until_birthday = (@this_month - @bday_month).abs
    end
  end

  def days_in_this_month
    case @this_month
    when 1 || 3 || 5 || 7 || 8 || 10 || 12
      days_in_this_month = 31
    when 2
      days_in_this_month = 28
    when 4 || 6 || 9 || 11
      days_in_this_month = 30
    end
  end

  def days_until_birthday
    if (@this_day - @bday_day) >= 0
      @days_until_birthday = @this_day - @bday_day
    else
      @days_until_birthday = (@this_day - @bday_day).abs
    end
  end

end