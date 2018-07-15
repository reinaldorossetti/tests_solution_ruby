$reports = (File.expand_path File.dirname(__FILE__) + "/features/reports/").gsub!('/', '//')
p path_jsons =  File.join($reports, "//jsons//")
p report_file =  File.join($reports, "//Motion_Report_Global")

# Exemplo03 exec not wait process finish.
puts exec("report_builder -s \"#{path_jsons}\" -o \"#{report_file}\"") # return shell status 0 or 1.
