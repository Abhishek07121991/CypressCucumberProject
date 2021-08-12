@ANPNTS-594 @Functional
Feature: Advanced Search -Search Parameters
    As an economic operator / customs officer
    I want to see all data concerning in the advanced search page
    so that I can search based on varios parameters

    Background: Set search result mock
        Given I have set search result mock

    Scenario: Check accessibility on the Advanced search page
        Given I have navigated to the Advanced search page
        Then I see the Advanced search page
        And the page should be accessible


    Scenario: Verify max length of fields for different fields
        Given I have navigated to the Advanced search page
        When I enter more data than allowed in each field marked with maximum characters
        Then I see that the input is trimmed upto the maximum allowed limit for that field


    Scenario: Validate helper text messages for different fields
        Given I have navigated to the Advanced search page
        Then I see the helper text at different fields on the page


    Scenario: Verify that all the checbox are unchecked
        Given I have navigated to the Advanced search page
        Then I see 10 checkboxes are present on the Advanced search page
        And I see all the checkboxes is unchecked on the Advanced search page


    Scenario: Verify that all the checboxes are clickable
        Given I have navigated to the Advanced search page
        When I click all the checkboxes on the Advanced search page
        Then I see all the checkboxes is checked on the Advanced search page


    Scenario: Verify Registration date range field is required to proceed to next step
        Given I have navigated to the Advanced search page
        When I click on the Search button
        Then I see an error is shown for Registration date range

    Scenario: Input values in text box and filters
        Given I have navigated to the Advanced search page
        When I filled in all the input text box
        And I click all the checkboxes on the Advanced search page


    Scenario: Verify search functionality with input text only
        Given I have navigated to the Advanced search page
        When I filled in all the input text box
        Then I click on the Search button
        Then I moved to the search results page

    Scenario: Verify clear functionality with input text and filters
        Given I have navigated to the Advanced search page
        When I filled in all the input text box
        And I click all the checkboxes on the Advanced search page
        Then I click on the Clear All button
        Then I see that text input is removed
        And I see all the checkboxes is unchecked on the Advanced search page


    Scenario: Verify search functionality with input text and filter
        Given I have navigated to the Advanced search page
        When I filled in input text box and checkbox
        Then I click on the Search button
        Then I moved to the Search results page





