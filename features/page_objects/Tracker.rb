class Tracker < SitePrism::Page
  #set_url "{/brand}/tracker"
  set_url "{url}"

  element :journal_selector, "input.select-dropdown"

# Summary Rejection Stats Table Headings
  element :rejected_heading, :xpath, "//th[@data-field='id']"
  element :found_heading, :xpath, "//th[contains(.,'Found')]"
  element :not_found_heading, :xpath, "//th[contains(.,'Not Found')]"

# Rejection Chart objects
  element :rejection_chart_first_link, "a.linked-journal"
  element :rejection_chart_last_link, "a.unlinked-journal"

# Destination Journal Stats Table Headings
  element :destination_heading, :xpath, "//th[contains(.,'Destination')]"
  element :count_heading, :xpath, "//th[contains(.,'Count')]"

# All Cells from all Tables on page
  elements :summary_stats, "tbody"

  section :header, ::HeaderSection, "nav.white"
  section :footer, ::FooterSection, "footer.page-footer.blue"

# Back to Select Publisher Page
  element :select_publisher_button, :css, ".waves-effect.waves-light.btn-large.red"

end
