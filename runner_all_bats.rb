def start_test(path)
  Dir.new(path).each { |file|
    puts file
    if file == "." or file == ".."
      next
    else
      file = file.split(".bat")[0]
      comando = ("cmd.exe /c \"cucumber --format html --out=\"C:\\xxx\\xxx\\xxx\\xxx\\#{file}.html\" --tag @#{file} TEST_ENV=SIT2_ATLAS BROWSER=ie ATLAS=true\"")
      puts system(comando)
    end
  }
end

path = File.expand_path('../xxx/xxx/xxx/tests/', File.dirname(__FILE__))
start_test(path)
