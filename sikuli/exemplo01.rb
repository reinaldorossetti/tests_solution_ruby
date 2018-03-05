require "xmlrpc/client"
require "pathname"

path = Pathname.new(File.dirname(__FILE__)).realpath.to_s
p path.gsub!("/", "\\")

command = Thread.new do
  system("taskkill -im cmd.exe /f /t")
  system("cmd.exe /c \"java -jar #{path}\\lib\\SikuliLibrary.jar 10000 reports \" ")
end

command # executa a thread.

3.times {
  sleep 5
  begin
    $client = XMLRPC::Client.new("127.0.0.1", "/", 10000)
  rescue
    "Primeira tentativa de conexao falhou!!!"
  end
}


commands = $client.call("get_keyword_names")

p commands # mostra os comandos da biblioteca.

$client.call("run_keyword", "addImagePath", [Pathname.new(File.dirname(__FILE__)).realpath.to_s + "/img"])
$client.call("run_keyword", "click", ["windows_start2.PNG"])
$client.call("run_keyword", "waitUntilScreenContain", ["computador.png", "5"])
$client.call("run_keyword", "click", ["computador.png"])

# client.call("run_keyword", "input_text", ["search_input.png", "notepad"])
# client.call("run_keyword", "doubleClick", ["notepad_title.png"])
