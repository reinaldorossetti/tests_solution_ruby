
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile.native_events = true
    $download_dir_atual = File.expand_path File.dirname(__FILE__) + '../../downloads'
    profile['browser.download.folderList'] = 2
    profile['pdfjs.disabled'] = true
    profile['browser.download.dir'] = $download_dir_atual.gsub("/", "\\\\") #"C:\\path_project\\features\\downloads"
    profile['browser.helperApps.neverAsk.saveToDisk']= "application/pdf, application/x-pkcs7, text/xml, text/csv, text/plain, text/log, application/zip, application/x-gzip, text/html, application/excel, application/vnd.ms-excel, application/x-excel, application/x-msexcel"

    # limpar o cache
    profile['browser.cache.disk.enable'] = false
    profile['browser.cache.memory.enable'] = false
    profile['browser.cache.offline.enable'] = false
    profile['network.http.use-cache'] = false

    Capybara::Selenium::Driver.new(app, :browser => :firefox, profile: profile, :marionette => true)
