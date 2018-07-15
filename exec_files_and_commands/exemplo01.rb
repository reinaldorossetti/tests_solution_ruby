$reports = (File.expand_path File.dirname(__FILE__) + "/features/reports/").gsub!('/', '//')
p path_jsons =  File.join($reports, "//jsons//")
p report_file =  File.join($reports, "//Motion_Report_Global")

# Start a new CMD shell windows and terminates.
p system("cmd /c report_builder -s \"#{path_jsons}\" -o \"#{report_file}\"")
