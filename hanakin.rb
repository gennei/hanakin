#!/usr/bin/env ruby

require 'date'

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

  def Show
    p "Year:#{@year}, Month:#{@month}"
    for i in 1...32
      # 翌月になっていないかチェック
      if @date.month != @month
        break
      end

      # 今日がなんの日かチェック
      if IsPayDay(@date) && IsFriday(@date)
        # 金曜日かつはなきんの場合
        p "FizzBuzz"
      elsif IsFriday(@date)
        # 金曜日の場合
        p "Fizz" 
      elsif IsPayDay(@date)
        # 給料日の場合
        p "Buzz"
      else
        p @date.day
      end
      @date += 1
    end
  end
end

hanakin = SuperHanakin.new(2014,9,5)
hanakin.Show