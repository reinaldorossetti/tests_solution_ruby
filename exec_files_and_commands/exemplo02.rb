$reports = (File.expand_path File.dirname(__FILE__) + "/features/reports/").gsub!('/', '//')
p path_jsons =  File.join($reports, "//jsons//")
p report_file =  File.join($reports, "//Motion_Report_Global")

# Exemplo02 not use cmd/c, using system and return true or false.
p system("report_builder -s \"#{path_jsons}\" -o \"#{report_file}\"")
