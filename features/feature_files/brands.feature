Feature: Brand selection post login

  As a member of the editorial department
  In order to see the manuscripts that have been rejected for all relevant journals for a particular brand
  I need to be able to select the brand from the displayed brands

  Scenario Outline: I am able to see the in-house brands post login

    Given I login as a <role>
    Then the brands bmc,nature,springer are displayed
    And the rejection breakdown page for the brands bmc,nature,springer are accessible

    Examples:
      | role      |
      | user      |
      | superuser |

