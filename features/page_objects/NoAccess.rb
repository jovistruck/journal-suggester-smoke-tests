class NoAccess < SitePrism::Page
  set_url "/"

  element :message, "div.row"

  section :header, ::HeaderSection, "nav.white"
  section :footer, ::FooterSection, "footer.page-footer.blue"

end
