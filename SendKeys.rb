# Require the win32ole library:
require 'win32ole'

'
To maximixe the active window "% x" (Alt+SpaceBar, x)
To minimize the active window "% n" (Alt+SpaceBar, n)
To restore the active window "% r" (Alt+SpaceBar, r)
To close window "%{F4}"
# ALT+A wsh.SendKeys("%a")
https://msdn.microsoft.com/en-us/library/8c6yea83.aspx
'

# Cria a instancia do Wscript Shell, para poder usar os metodos.
wsh = WIN32OLE.new('Wscript.Shell')

# Passar o Nome da Janela atual
if wsh.AppActivate('*new 3 - Notepad++')
  # Tempo de espera em segundos
  sleep(1)
  # comando SendKeys para enviar o comando
  wsh.SendKeys("% x")
end