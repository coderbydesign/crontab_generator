require 'sinatra'
require 'haml'
require './crontab_formatter.rb'

get '/' do
  haml :index
end

post '/' do
  formatter = CrontabFormatter.new(:minute => params[:minute],
    :hour => params[:hour],
    :day_of_month => params[:day_of_month],
    :month => params[:month],
    :day_of_week => params[:day_of_week],
    :command => params[:command]
  )

  @params = params
  @crontab = formatter.convert_to_cron_command

  haml :index
end