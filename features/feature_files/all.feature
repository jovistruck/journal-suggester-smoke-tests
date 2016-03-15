@wip
Feature: Track manuscripts that have been rejected by editorial department

  As a member of the editorial department
  In order to see how many manuscripts have been rejected for all relevant journals
  I need to be able to see a display of all manuscripts that have been rejected by us and if applicable accepted and published by other organisations


  Scenario: I am able to see a summary of rejection statistics by publisher and journal (where applicable)

  Given I am a member of the editorial department for a macmillan publishing brandWhen I view the rejection tool initial landing page for that publishing brand
  Then I can see a how many manuscripts have been rejected
  And  I can see how many of these rejected manuscripts are now published by another publishing organisation
  And  I can see the destination journal titles for rejections that went to the top ten publishers by volume
  And  I can see aggregated counts for rejections published by organisation no in the top ten by volume


  Scenario: I am able to see more detailed rejection statistics by journal title

  Given I am a member of the editorial department for a macmillan publishing brand
  And  I view the rejection tool initial landing page for that publishing brand
  When I click on the name of any specific journal title from the list of destination journals
  Then I can see the list containing each manuscript that was rejected
  And  summary details of the rejection
  And  summary details of the manuscript as a published article
  And  there is a link to that published article


  Scenario: I am able to see any published articles that were manuscripts that I rejected

  Given I am a member of the editorial department for a macmillan publishing brand
  And  I am viewing the summary list of rejections by a give destination journal
  When I click on the published article title for any rejected manuscript
  Then I am taken to the published content page for that article
  And  it belongs to the expected destination journal hosted on the expected publishers site


  Scenario: I am able to see rejections by a specific journal title

  Given I am a member of the editorial department for a specific journal
  And  I am on the rejection tool initial landing page for that specific journal's publishing brand
  When I select to filter by my specific journal
  Then I am able to see the list of rejections specific to my journal


  Scenario: I am able to see published articles that I rejected as manuscripts submitted for my journal

  Given I am a member of the editorial department for a specific journal
  And  I am on the rejection results list for a specific journal title
  When I click on the link for any Given publication title
  Then I am taken to the web page that displays the published version of the manuscript