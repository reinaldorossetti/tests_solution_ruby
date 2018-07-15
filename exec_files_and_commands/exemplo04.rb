require 'open3'

$reports = (File.expand_path File.dirname(__FILE__) + "/features/reports/").gsub!('/', '//')
p path_jsons =  File.join($reports, "//jsons//")
p report_file =  File.join($reports, "//Motion_Report_Global")

# O open3 é mais completo interage com o processo, nesse caso pego o pid do processo.
Open3.popen3("report_builder -s \"#{path_jsons}\" -o \"#{report_file}\""){|stdin, stdout, stderr, wait_thr|
  p $pid = wait_thr.pid # pid of the started process.
  p exit_status = wait_thr.value # Process::Status object returned.
}
p system("TASKKILL /PID #{$pid}")
