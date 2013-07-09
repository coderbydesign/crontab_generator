class CrontabFormatter
  attr_reader :minute, :hour, :day_of_month, :month, :day_of_week, :command

  def initialize(args)
    @minute = args[:minute]
    @hour = args[:hour]
    @day_of_month = args[:day_of_month]
    @month = args[:month]
    @day_of_week = args[:day_of_week]
    @command = args[:command]
  end

  def convert_to_cron_command
    "#{join_vals(@minute)} #{join_vals(@hour)} #{join_vals(@day_of_month)} #{join_vals(@month)} #{join_vals(@day_of_week)} #{@command}"
  end

  def join_vals(vals)
    vals.nil? ? "*" : vals.join(",")
  end
end