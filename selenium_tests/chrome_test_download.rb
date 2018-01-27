    prefs = {
        download: {
            prompt_for_download: false,
            default_directory: $download_dir_atual
        },
        plugins: {
            always_open_pdf_externally: true
        }
    }
    args = ["--start-maximized"]

    Capybara::Selenium::Driver.new(app, browser: :chrome, prefs: prefs, :args => args)
