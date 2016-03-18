class JournalInfoSubmit < SitePrism::Page
  set_url "/"

  # Submit Form Elements
  element :title_field, :id, "title"
  element :body_field, :id, "content"
  element :keywords_field, :id, "keywords"
  element :maximum_impact_field, :id, "maxImpactFactor"
  element :primary_subject_field, "select#primary-subject"
  element :secondary_subjects_field, "select#secondary-subjects"
  element :find_journals_button, :id, "suggest"

  # Journal Suggestion Results Table
  ## Table
  element :results_table, :css, ".table"
  element :name_table_header, :css, ".table.table-striped>thead>tr>th:nth-child(1)"
  element :impact_factor_table_header, :css, ".table.table-striped>thead>tr>th:nth-child(2)"
  element :access_type_table_header, :css, ".table.table-striped>thead>tr>th:nth-child(3)"
  elements :results_table_rows, :css, ".table.table-striped>tbody>tr"
  elements :journal_names_in_results, :css, ".result-row>td>a"

  ## Show More Copy Buttons
  element :show_more_button, :id, "show-more"
  element :copy_to_clipboard_button, :id, "copy-button"

  ## Select Check Boxes Journals
  elements :select_checkboxes_table, :css, "#selectedJournals"

  # Login Headers and Footers
  section :header, ::HeaderSection, "nav.white"

end
