$project = (File.expand_path File.dirname(__FILE__) + "/features/reports/").gsub!('/', '//')
p json =  File.join($project, "//jsons//")
p report =  File.join($project, "//Motion_Report_Global")

# Start a new CMD shell and terminates
p system("cmd /c report_builder -s \"#{json}\" -o \"#{report}\"")
