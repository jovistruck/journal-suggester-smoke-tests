When (/^I click on the first destination journal title$/) do
  @app.tracker.rejection_chart_first_link.click
  current_url = @app.tracker.current_url
end
