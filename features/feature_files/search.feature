@search
Feature: Find Journals for the provided manuscript

  As a member of the transfers desk
  In order to see journals that the manuscript can be transferred to
  I need to be able to find journals that would be appropriate for the manuscript

  Background:
    Given I am on the submit journal info page

  Scenario: I am able to see the correct journal suggested for a specific manuscript

    When I submit a manuscript with doi id 10.1007/s12374-011-9178-3
    Then the corresponding journal for the manuscript with doi id 10.1007/s12374-011-9178-3 is displayed

  Scenario: I am able to see more results by clicking on the show more button

    When I submit a manuscript with doi id 10.1007/s12374-011-9178-3
    Then the results contain 10 items
    And I want to see more suggestions
    Then the results contain 21 items

  @wip @for_testing
  Scenario: I am able to see matching results for all the test manuscripts

    Then I submit and validate results for all test manuscripts