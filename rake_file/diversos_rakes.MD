
No rakefile podemos deixar o caminho dinamico das pastas nos rake filhos, só deixamos o comando abaixo antes da chamada.
$report = File.expand_path File.dirname(__FILE__) + '/features/reports'

# Importa todos os arquivos .rake da pasta tasks
Dir.glob('tasks/*.rake').each { |r| import r }
