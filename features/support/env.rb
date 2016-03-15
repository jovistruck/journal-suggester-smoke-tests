require 'capybara'

  case ENV['TARGET']
   when 'staging' then Capybara.app_host = 'http://journal-suggester-web-staging.live.cf.private.springer.com/'
    puts  "\n>>>> ENVIRONMENT = STAGING <<<<\n\n"
   when 'live' then Capybara.app_host = 'http://journal-suggester-web-dev.dev.cf.private.springer.com/'
    puts  "\n>>>> ENVIRONMENT = LIVE <<<<\n\n"
  end