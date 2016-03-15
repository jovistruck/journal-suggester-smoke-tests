@wip
Feature: Track manuscripts that have been rejected by editorial department

  As a member of the editorial department
  In order to see how many manuscripts have been rejected for all relevant journals
  I need to be able to see a display of all manuscripts that have been rejected by us and if applicable accepted and published by other organisations


  Scenario Outline: I am able to see a summary of rejection statistics by publisher and journal

    Given I login as a <role>
    And I have selected to view <brand> rejections
    When I click on the first destination journal title
    Then I see the <expected> page

    Examples:
      | role      | brand    | expected            |
      | user      | bmc      | no access           |
      | superuser | bmc      | rejection breakdown |
      | user      | nature   | no access           |
      | superuser | nature   | rejection breakdown |
      | user      | springer | no access           |
      | superuser | springer | rejection breakdown |