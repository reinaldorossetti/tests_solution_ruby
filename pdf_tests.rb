#encoding: utf-8
require 'pdf/reader'
require 'fileutils'
# gem 'pdf-reader'

module PdfTests

  #puts reader.pdf_version
  #puts reader.info
  #puts reader.metadata
  #puts reader.page_count

  def file_name(name)
    name='laudo.pdf' if name.empty?
    $pdf = File.expand_path File.dirname(__FILE__) + "../../downloads/#{name}"
  end

  def read_file(name='')
    file_name(name)
    p $pdf if $log_console
    File.open($pdf, "rb") do |io|
      reader = PDF::Reader.new(io)
      page = reader.page(1).text
      p page if $log_console
      return page
    end
  end

  def remover_pdf(name='')
    file_name(name)
    File.delete($pdf) if File.exist?($pdf)
    rescue => ex
      FileUtils.rm($pdf)
      p ex.message
  end

  # Espera por 30s com intervalo de 0.5s.
  def file_exists(timeout=60, name='')
    file_name(name)
    timeout.times{ |times|
      p times if $log_console
      if File.exist?($pdf)
        return true
      end
      sleep 1
    }
    false
  end

end

include PdfTests

# exemplo de uso.
# 1. dar o clique para baixar o pdf na pasta
# > somente dar o clique no 'button[id="download"]' que está dentro do frame.
# 2. realizar os testes como no exemplo.
# 3. deletar o arquivo.
#
string="6000.0265.8008"
$log_console = true

if file_exists
  raise "Informação desejada não encontrada no PDF!" unless read_file.include?(string)
else
  p "O arquivo não existe!"
end
