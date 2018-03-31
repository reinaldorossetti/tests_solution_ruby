require 'logger'

# Ler ou cria o arquivo .log.
file = File.open('Log_file_#{date_time.to_s}.log', 'w+')

# instancia a classe Logger.
logger = Logger.new(file)

# Define somente os erros no log.
logger.level = Logger::ERROR 

# Alterando para o formato brasileiro.
logger.datetime_format = '%d-%m-%Y %H:%M:%S'

# como usar a classe log do ruby na funcao.
begin
	t = 4/0
rescue => ex
	logger.error(ex)
end
