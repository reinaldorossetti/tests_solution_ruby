## Devemos primeiro criar o arquivo "Rakefile" sem aspas, e sem extensão de arquivo.

```ruby
require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

vezes = ENV['QUANT'].to_i
vezes=1 if vezes.nil?

namespace :massa do
  desc 'Executar massa de dados amostra GLI'
  task :gerar_amostra_GLI_pronto_para_execucao do
    vezes.times do |x|
      p "VEZES: #{x}"
      sh 'cucumber --format html --out="features/reports/Geração de massa de dados.html" -t @gerar_massa_tag BROWSER=firefox'
    end
  end
end

task build: %w[massa:gerar_amostra_GLI_pronto_para_execucao]
```

### No CMD/Shell você deve digitar o comando a seguir:  bundle exec rake build QUANT=3
