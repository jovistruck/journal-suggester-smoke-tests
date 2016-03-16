@search
Feature: Find Journals for the provided manuscript

  As a member of the transfers desk
  In order to see journals that the manuscript can be transferred to
  I need to be able to find journals that would be appropriate for the manuscript

  Scenario: I am able to see the correct journal suggested for a specific manuscript

    Given I am on the submit journal info page
    And I submit a manuscript with doi id 10.1007/s12374-011-9178-3
    Then the results contain 21 items
    And the corresponding journal for the manuscript with doi id 10.1007/s12374-011-9178-3 is displayed

  Scenario: I am able to see the correct journal suggested all existing test manuscripts

    Given I am on the submit journal info page
    Then I submit and validate results for all test manuscripts