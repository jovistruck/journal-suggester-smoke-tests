class RejectionList < SitePrism::Page
  set_url "/{recipient_issn}"

# Page Attributes
  element :rejection_list_title, "h1"

# Table Headings
  element :rejected_from_heading, :xpath, "//th[contains(.,'Rejected From')]"
  element :title_heading, :xpath, "//th[contains(.,'Title')]"
  element :rejected_heading, :xpath, "//th[contains(.,'Rejected')]"
  element :authors_heading, :xpath, "//th[contains(.,'Authors')]"
  element :published_title_heading, :xpath, "//th[contains(.,'Published Title')]"

# Table First Column
  elements :results_table_first_column, :xpath, "//table[@class='striped drilldown-table']/tbody/tr/td[1]"

# Header and Footer Sections
  section :header, ::HeaderSection, "nav.white"
  section :footer, ::FooterSection, "footer.page-footer.blue"

end
