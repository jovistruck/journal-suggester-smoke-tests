@wip
Feature: Login for the rejections application

  As a member of the editorial department
  In order to see the manuscripts that have been rejected for all relevant journals
  I need to be able to authenticate and login into the application

  Scenario Outline: I am able to login with valid credentials for different roles

    Given I login as a <role>
    And I have selected to view bmc rejections
    When I click on the first destination journal title
    Then I see the <expected> page

    Examples:
      | role      | expected            |
      | user      | no access           |
      | superuser | rejection breakdown |

  Scenario: I am unable to login with invalid credentials

    Given I login as an unauthorized user
    Then access is denied

  #I try to access links step below needs to be fixed
  @wip
  Scenario: I am unable to access pages requiring authorization without logging in

    Given I try to access links that need authorization
    Then access is denied
