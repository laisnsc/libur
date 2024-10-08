RSpec.configure do |config|
  config.before(:each, type: :system) do
    if ENV["SHOW_BROWSER"]
      driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
    else
      driven_by :selenium_chrome_headless, using: :headless_chrome, screen_size: [1400, 1400]
    end
  end
end