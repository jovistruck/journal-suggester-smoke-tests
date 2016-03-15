Given(/^I have selected to view (.*) rejections$/) do |brand|
  case brand
    when 'bmc'
      @app.select_brand.bmc_button.click
      @app.tracker.wait_until_rejection_chart_first_link_visible
      title = @app.tracker.title.to_s
      expected_title="Rejection Tracker for BioMed Central: All BioMed Central journals"
      validate_tracker_page(title,expected_title)
      $first_brand_link_text=@app.tracker.rejection_chart_first_link.text.split(" : ").last
      $first_brand_link_count=@app.tracker.rejection_chart_first_link.text.split(" : ").first.to_i
    when 'nature'
      @app.select_brand.nature_button.click
      @app.tracker.wait_until_rejection_chart_first_link_visible
      title = @app.tracker.title.to_s
      expected_title="Rejection Tracker for Nature: All Nature journals"
      validate_tracker_page(title,expected_title)
    when 'springer'
      @app.select_brand.springer_button.click
      @app.tracker.wait_until_rejection_chart_first_link_visible
      title = @app.tracker.title.to_s
      expected_title="Rejection Tracker for Springer: All Springer journals"
      validate_tracker_page(title,expected_title)
  end
end

And(/^the rejection breakdown page for the brands (.*) are accessible$/) do |brands|
  for brand in brands.split(',')
    step "I have selected to view #{brand} rejections"
    @app.select_brand.springer_button.click
    @app.tracker.wait_until_rejection_chart_first_link_visible


    @app.tracker.select_publisher_button.click
  end
end

def validate_tracker_page (title,expected_title)
  expect(title).to eq(expected_title)
  expect(@app.tracker).to have_journal_selector
  expect(@app.tracker).to have_rejected_heading
  expect(@app.tracker).to have_found_heading
  expect(@app.tracker).to have_not_found_heading
  expect(@app.tracker).to have_rejection_chart_first_link
  expect(@app.tracker).to have_rejection_chart_last_link
  expect(@app.tracker).to have_destination_heading
  expect(@app.tracker).to have_count_heading
  expect(@app.tracker).to have_summary_stats
end
