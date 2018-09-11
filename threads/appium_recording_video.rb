require 'open3'

 a = Thread.new { 
 5.times { |n|
 Open3.popen3("adb shell screenrecord --time-limit 180 /sdcard/video_#{n}.mp4"){|stdin, stdout, stderr, wait_thr|
  p $pid = wait_thr.pid
  p exit_status = wait_thr.value
}
system("TASKKILL /PID #{$pid}")
  }}
a.join
Thread.kill(a)
