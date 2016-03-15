require 'yaml'

And(/^I submit a manuscript for suggestions with doi id (.*)$/) do |doi_id|

  populate_and_submit_manuscript_suggest_form(fetch_articles_for_publisher("springer"),doi_id)
  @app.journal_info_submit.show_more_button.click

end

def fetch_articles_for_publisher (publisher)

  config = YAML.load_file(File.expand_path("../../../../", __FILE__) + "/resources/test-data/journals/" + publisher+ "/" + "articles.yml")
  return config
end


def populate_and_submit_manuscript_suggest_form (publisher_articles,doi_id)

  @app = App.new
  @app.journal_info_submit.load

  @app.journal_info_submit.title_field.set publisher_articles[doi_id]["title"]
  @app.journal_info_submit.body_field.set publisher_articles[doi_id]["body"]
  @app.journal_info_submit.keywords_field.set publisher_articles[doi_id]["keywords"]
  @app.journal_info_submit.maximum_impact_field.set publisher_articles[doi_id]["maximum_impact_factor"]
  @app.journal_info_submit.primary_subject_field.select publisher_articles[doi_id]["primary_subject"]
  @app.journal_info_submit.secondary_subjects_field.select publisher_articles[doi_id]["secondary_subjects"]
  @app.journal_info_submit.find_journals_button.click
end


Then(/^the results contain (.*) items for the manuscript with doi id (.*)$/) do |number_of_items,doi_id|

  @app.journal_info_submit.wait_until_name_table_header_visible
  expect(@app.journal_info_submit.name_table_header.text).to include("Name")
  expect(@app.journal_info_submit.impact_factor_table_header.text).to include("Impact Factor")
  expect(@app.journal_info_submit.access_type_table_header.text).to include("Access Type")
  expect(@app.journal_info_submit).to have_copy_to_clipboard_button
  expect(@app.journal_info_submit.results_table_rows.size).to eq(number_of_items.to_i)
  # todo: doi_id
end