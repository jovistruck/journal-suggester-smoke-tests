Then(/^the brands (.*) are displayed$/) do |brands|

  for brand in brands.split(',')
    if brand == "bmc"
      expect(@app.select_brand).to have_bmc_button
    elsif brand == "springer"
      expect(@app.select_brand).to have_springer_button
    elsif brand == "nature"
      expect(@app.select_brand).to have_nature_button
    else
      fail "Brand mismatch in step"
    end
  end

end

Given(/^I try to access links that need authorization$/) do
  @tracker = Tracker.new
  @tracker.load(url: 'http://www.google.com')
end