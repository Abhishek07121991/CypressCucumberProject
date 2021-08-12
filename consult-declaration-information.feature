Feature:As a user navigate to different components on the Declaration information consult page

  Background: Prepare declaration test data
    Given Prepare declaration test mock data

  Scenario: Validate the data on the parties page of declaration information
    When I navigate to the parties page for declaration
    Then I see the parties page
    And I see the declarant details of the declaration
    And I see the representative details of the declaration
    Then the page should be accessible

  Scenario: Validate the data on the general information page of declaration information
    Given I navigate to the general information page for declaration
    Then I see the general information page
    And I see the  general information details on general information page
    And I see the addressed custom office details on general information page
    And I see the entry information details on general information page
    And I see the Location of goods details on general information page
    Then the page should be accessible
