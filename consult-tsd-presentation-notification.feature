Feature:As a user navigate to different components on the Presentation notification consult page

  Background: Prepare presentation notification test data
    Given Prepare presentation test mock data

  Scenario: Validate the data on the parties page of presentation notification
    When I navigate to the parties page for presentation notification
    Then I see the parties page
    And I see the person presenting the goods details of the presentation notification
    And I see the carrier details of the presentation notification
    And the page should be accessible

  Scenario: Validate the data on the general information page of presentation notification
    Given I navigate to the general information page for presentation notification
    Then I see the general information page
    And I see the  general information details on general information page
    And I see the  notification information details on general information page
    And I see the addressed custom office details on general information page
    And I see the Presented location of goods details on general information page
    And the page should be accessible
