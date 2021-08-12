@571 @570  @Functional
Feature: New declaration - Submit/ New declaration - Overview


    Scenario: Validate Submit functionality when there is no errors
        Given Prepare New declaration mock test data
        When I am on the last consignment items page
        And I click on Submit button
        Then I see the overview page
        And the page should be accessible

    Scenario: Validate error message when there is form errors
        Given Prepare New declaration mock test data when there is form errors
        When I am on the last consignment items page
        And I click on Submit button
        Then I see the form error message

    Scenario: Validate error message when there is no ENS data provided
        Given Prepare New declaration mock test data when there is no ENS data provided
        When I am on the last consignment items page
        And I click on Submit button
        Then I see the No ENS data found error message


    Scenario: Validate error message when there is no EORI data provided
        Given Prepare New declaration mock test data when there is no EORI data provided
        When I am on the last consignment items page
        And I click on Submit button
        Then I see the missing EORI data error message


    Scenario: Validate error message when invalid data is provided
        Given Prepare New declaration mock test data when invalid data is provided
        When I am on the last consignment items page
        And I click on Submit button
        Then I see the invalid data error message

    Scenario: Validate Submit button is not present if user is not on the last consignment items page
        Given Prepare New declaration mock test data
        When I am not on the last consignment items page
        Then I dont see the Submit button


    Scenario: Validate create new functionality on the error dialog
        Given Prepare New declaration mock test data when invalid data is provided
        When I am on the last consignment items page
        And I click on Submit button
        And I click on create new button on the error dialog
        Then I moved to the question wizard page



    Scenario: Validate cancel functionality on the error dialog
        Given Prepare New declaration mock test data when invalid data is provided
        When I am on the last consignment items page
        And I click on Submit button
        And I click on cancel button on the error dialog
        Then I move to the last consignment item page


    Scenario: Validate overview screen when there is no errors
        Given Prepare New declaration mock test data
        When I am on the last consignment items page
        And I click on Submit button
        Then I see the overview page
        And I see overview page details
        And I see Confirm and Cancel button on the overview page


    Scenario: Validate cancel functionality on the overview page
        Given Prepare New declaration mock test data
        And I am on the last consignment items page
        When I click on Submit button
        Then I see the overview page
        And I click on the cancel button on the overview page
        Then I move to the last consignment item page


