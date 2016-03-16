require 'yaml'

Before do |scenario|
  $articles=fetch_articles
end

And(/^I submit a manuscript with doi id (.*)$/) do |doi_id|
  populate_and_submit_manuscript_suggest_form(doi_id)
  $app.journal_info_submit.wait_until_name_table_header_visible
  $app.journal_info_submit.show_more_button.click
end

Then(/^the results contain (.*) items$/) do |number_of_items|
  validate_results_table
  verify_number_of_results(number_of_items)
end

Then(/^the corresponding journal for the manuscript with doi id (.*) is displayed$/) do |doi_id|
  verify_if_results_contain_journal($articles["manuscripts"][doi_id]["journal"])
end

And(/^I submit a manuscript$/) do
  @randomly_picked_article=$articles["manuscripts"].keys.sample
  populate_and_submit_manuscript_suggest_form(@randomly_picked_article)
  $app.journal_info_submit.wait_until_name_table_header_visible
  $app.journal_info_submit.show_more_button.click
end

Then(/^the results contain the corresponding journal for the manuscript$/) do
  validate_results_table
  verify_if_results_contain_journal($articles["manuscripts"][@randomly_picked_article]["journal"])
end

def fetch_articles
  YAML.load_file(File.dirname(__FILE__) + '/../../../resources/test-data/journals/' + "articles.yml")
end

def populate_and_submit_manuscript_suggest_form (doi_id)
  $app.journal_info_submit.title_field.set $articles["manuscripts"][doi_id]["title"]
  $app.journal_info_submit.body_field.set $articles["manuscripts"][doi_id]["body"]
  $app.journal_info_submit.keywords_field.set $articles["manuscripts"][doi_id]["keywords"]
  $app.journal_info_submit.maximum_impact_field.set $articles["manuscripts"][doi_id]["maximum_impact_factor"]
  $app.journal_info_submit.primary_subject_field.select $articles["manuscripts"][doi_id]["primary_subject"]
  $app.journal_info_submit.secondary_subjects_field.select $articles["manuscripts"][doi_id]["secondary_subjects"]
  $app.journal_info_submit.find_journals_button.click
end

def validate_results_table
  expect($app.journal_info_submit.name_table_header.text).to include("Name")
  expect($app.journal_info_submit.impact_factor_table_header.text).to include("Impact Factor")
  expect($app.journal_info_submit.access_type_table_header.text).to include("Access Type")
  expect($app.journal_info_submit).to have_copy_to_clipboard_button
end

def verify_number_of_results (expected_number_of_results)
  expect($app.journal_info_submit.results_table_rows.size).to eq(expected_number_of_results.to_i)
end

def verify_if_results_contain_journal (expected_journal_name)
  journal_names = Array.new
  $app.journal_info_submit.journal_names_in_results.each do |journal_name|
    journal_names.push(journal_name.text)
  end
  expect(journal_names).to include(expected_journal_name)
end