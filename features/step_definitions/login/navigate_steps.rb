Given(/^I login as an? (.*)$/) do |role|
  @app = App.new
  @app.login.load
  title = @app.login.title.to_s
  expect(title).to eq("Springer Nature")
  #puts "URL: " + @app.login.current_url + "\n"
  #puts "Page Title: " + @app.login.title + "\n"

  case role
    when 'user'
      #puts "The current user is: " + role.to_s
      @app.login.username_field.set "demo"
      @app.login.password_field.set "demo1"
      @app.login.login_button.click
      expect(@app.login.title.to_s).to eq("Springer Nature Rejection Tracker")
      #puts "URL: " + @app.login.current_url + "\n"
      #puts "URL: " + @app.login.title + "\n"
    when 'superuser'
      #puts "The current user is: " + role.to_s
      @app.login.username_field.set "special"
      @app.login.password_field.set "demo2854242"
      @app.login.login_button.click
      expect(@app.login.title.to_s).to eq("Springer Nature Rejection Tracker")
      #puts "URL: " + @app.login.current_url + "\n"
      #puts "URL: " + @app.login.title + "\n"
    when 'unauthorized user'
      @app.login.username_field.set "unauthorized"
      @app.login.password_field.set "password"
      @app.login.login_button.click
      expect(@app.login.title.to_s).to eq("Springer Nature")
  end
end
