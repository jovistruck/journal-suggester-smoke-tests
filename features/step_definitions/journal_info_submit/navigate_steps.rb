Given(/^I am on the submit journal info page$/) do
  $app = App.new
  $app.journal_info_submit.load
end