File.open('/logs/source_error.html', 'w') do |file|
  io = StringIO.new(session.driver.browser.page_source)
  file.write(io.read)
end
