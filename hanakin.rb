# Hanakin

require 'date'

year = 2014
month = 9
payday = 25

class SuperHanakin
  def initialize(year, month, payday)
    @year = year
    @month = month
    @payday = payday
    @date = Date.new(year, month, 1)
  end

  def IsFriday(day)
    return day.wday == 5
  end

  def IsPayDay(day)
    return day.day == @payday
  end

  def IsHoliday(day)
    day.wday == 6 || day.wday == 0
  end

  def Display
    p "Year:#{@year}, Month:#{@month}"
    for i in 1...32
      # 翌月になっていないかチェック
      if @date.month != @month
        break
      end

      # 今日がなんの日かチェック
      if IsPayDay(@date) && IsFriday(@date)
        # 金曜日かつはなきん
        p "スーパーはなきん"
      elsif IsPayDay(@date)
        # 給料日
        p "給料日だ。やったー"
      elsif IsFriday(@date)
        # 金曜日かどうかチェック
        p "は、はなきんだ〜" 
      else
        p @date.to_s
      end
      @date += 1
    end
  end
end

hanakin = SuperHanakin.new(year, month, payday)
hanakin.Display