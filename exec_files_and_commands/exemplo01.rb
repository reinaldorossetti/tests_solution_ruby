$project = (File.expand_path File.dirname(__FILE__) + "/features/reports/").gsub!('/', '//')
p path_jsons =  File.join($project, "//jsons//")
p path_report =  File.join($project, "//Motion_Report_Global")

# Start a new CMD shell and terminates
p system("cmd /c report_builder -s \"#{path_jsons}\" -o \"#{path_report}\"")
