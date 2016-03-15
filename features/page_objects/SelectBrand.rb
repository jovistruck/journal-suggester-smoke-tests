class SelectBrand < SitePrism::Page
  set_url "/"

  element :bmc_button, :xpath, "//img[@src='images/bmc.jpg']"
  element :nature_button, :xpath, "//img[@src='images/nature.jpg']"
  element :springer_button, :xpath, "//img[@src='images/springer.jpg']"

  section :header, ::HeaderSection, "nav.white"
  section :footer, ::FooterSection, "footer.page-footer.blue"

end
