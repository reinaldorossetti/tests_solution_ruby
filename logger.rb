require 'logger'
require 'date'

file = File.open('Log_file_#{date_time.to_s}.log', 'w+')
logger = Logger.new(file)
logger.level = Logger::ERROR
logger.datetime_format = '%d-%m-%Y %H:%M:%S'

begin
	t = 4/0
rescue => ex
	p ex
	logger.error(ex)
end


