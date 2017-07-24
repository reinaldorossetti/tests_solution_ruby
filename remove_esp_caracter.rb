# funcao que eh um truque pra remover os caractes especiais.

def remove_caracter_esp(string)
    string = string.tr("ÀÁÂÃÄÅàáâãäåĀāĂăĄąÇçĆćĈĉĊċČčÐðĎďĐđÈÉÊËèéêëĒēĔĕĖėĘęĚěĜĝĞğĠġĢ‌​ģĤĥĦħÌÍÎÏìíîïĨĩĪīĬĭĮ‌​įİıĴĵĶķĸĹĺĻļĽľĿŀŁłÑñ‌​ŃńŅņŇňŉŊŋÒÓÔÕÖØòóôõö‌​øŌōŎŏŐőŔŕŖŗŘřŚśŜŝŞşŠ‌​šȘșſŢţŤťŦŧȚțÙÚÛÜùúûü‌​ŨũŪūŬŭŮůŰűŲųŴŵÝýÿŶŷŸ‌​ŹźŻżŽž", "AAAAAAaaaaaaAaAaAaCcCcCcCcCcDdDdDdEEEEeeeeEeEeEeEeEeGgGgGgG‌​gHhHhIIIIiiiiIiIiIiI‌​iIiJjKkkLlLlLlLlLlNn‌​NnNnNnnNnOOOOOOooooo‌​oOoOoOoRrRrRrSsSsSsS‌​sSssTtTtTtTtUUUUuuuu‌​UuUuUuUuUuUuWwYyyYyY‌​ZzZzZz")
end
  
puts remove_caracter_esp("João")
  
