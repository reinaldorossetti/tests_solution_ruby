# criando uma variavel de ambiente com path do projeto relativo.
ENV['IE_DRIVER_64'] = File.expand_path('../../../ambiente/drivers/IEDriverServer64.exe', File.dirname(__FILE__))

puts ENV['IE_DRIVER_64']
