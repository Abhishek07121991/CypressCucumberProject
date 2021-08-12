@ANPNTS-608
Feature: Consult TSD Event history
    As an economic operator / customs officer, I want to consult a declaration history
    so that I can have an overview of all events (amendment, invalidation, submission) of a declaration

    Background:
        Given Prepare event history test mock data

    Scenario: Navigate to history page
        Given I have navigated to Consult declaration page
        When I click on History section under navigation drawer
        Then I see the event history page
        And I see table "History" with headers
        And data in table "History" is sorted by date in descending order
        And the page should be accessible

    Scenario: Use pagination and verify data
        Given I have navigated to Event History page
        Then I see the event history page
        And I can use the pagination of the "History" table

    Scenario: test sorting data by column
        Given I have navigated to Event History page
        Then I see data in "History" table can be sorted by column in ascending order

    Scenario: Verify amendment - View request
        Given I have navigated to Event History page
        When I select "View request" option from actions for "Amendment" category and Request status as "Approved"
        Then I see the Amendment requests details
        And I click on Back button on "Amendment" page
        Then I should get redirected to History page

    Scenario: Verify amendment - View error
        Given I have navigated to Event History page
        When I select "View error" option from actions for "Amendment" category and Request status as "Refused"
        Then I see a dialogue is displayed with close button
        And I see the error message
        And I get redirected to History page on clicking close button

    Scenario: Verify submission - View
        Given I have navigated to Event History page
        When I go to next page

        When I select "View" option from actions for "Submission" category and Request status as "Approved"
        Then I see the submission details
        And I click on Back button on "Submission" page
        Then I should get redirected to History page

    Scenario: Verify invalidation - View request
        Given I have navigated to Event History page
        When I select "View request" option from actions for "Invalidation" category and Request status as "Approved"
        Then I see a dialogue is displayed with close button
        And The reason is displayed in the pop-up
        And I get redirected to History page on clicking close button

    Scenario: Verify invalidation - View error
        Given I have navigated to Event History page
        When I select "View error" option from actions for "Invalidation" category and Request status as "Refused"
        Then I see a dialogue is displayed with close button
        And The invalidation error is displayed in the pop-up
        And I get redirected to History page on clicking close button




