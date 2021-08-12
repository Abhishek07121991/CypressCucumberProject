@572 @582 @Functional
Feature: New declaration - Submission confirmation/New Decalartion Progress Indicator

    Scenario: Validate success banner on the consult page
        Given Prepare New declaration mock test data for success
        When I am on the last consignment items page
        And I click on Submit button
        And I click on the confirm button
        Then I moved to the consult page
        And I see the banner with success message

    Scenario: Validate failure banner on submitting declaration
        Given Prepare New declaration mock test data for failure
        When I am on the last consignment items page
        And I click on Submit button
        And I click on the confirm button
        Then I moved to the home page
        And I see the banner with failure message


    Scenario: Validate dismiss functionality on the failure banner
        Given Prepare New declaration mock test data for failure
        When I am on the last consignment items page
        And I click on Submit button
        And I click on the confirm button
        And I click on the dismiss button on the banner
        Then I dont see the banner on the page


    Scenario: Validate dismiss functionality on the success banner
        Given Prepare New declaration mock test data for success
        When I am on the last consignment items page
        And I click on Submit button
        And I click on the confirm button
        And I click on the dismiss button on the banner
        Then I dont see the banner on the page

    Scenario: Verify progress bar indicator after submitting declaration
        Given Prepare New declaration mock test data for success
        When I am on the last consignment items page
        And I click on Submit button
        #Then I see the progress bar
        And I see the overview page
        Then I dont see the progress bar

