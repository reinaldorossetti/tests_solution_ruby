#encoding: utf-8
require 'pdf/reader'
# gem 'pdf-reader'

$file = File.expand_path File.dirname(__FILE__) + '../../reports/laudo.pdf'

module PdfTests

  #puts reader.pdf_version
  #puts reader.info
  #puts reader.metadata
  #puts reader.page_count

  def read_file
    File.open($file, "rb") do |io|
      reader = PDF::Reader.new(io)
      page = reader.page(1)
      return page.text
    end
  end

  def remove
    File.delete($file) if File.exist?($file)
  end

  # Espera por 30s com intervalo de 0.5s.
  def file_exists(timeout=60)
    timeout.times{
      if File.exist?($file)
        return true
      end
      sleep 0.5
    }
    false
  end

end

include PdfTests

string="6000.0265.8008"
$log_console = true

if file_exists
  p read_file if $log_console
  raise "Informação desejada não encontrada no PDF!" unless read_file.include?(string)
  remove
else
  p "O arquivo não existe!"
end
