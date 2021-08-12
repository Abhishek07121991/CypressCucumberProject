@ANPNTS-600 @Functional
Feature: Saved TSD drafts - Drafts
    As an economic operator / customs officer
    I want to have a page where all saved drafts are stored
    so that I can continue working on a draft when needed

    Scenario: Display the TSD drafts screen with records
        Given I have navigated to the TSD drafts page
        Then I see the TSD drafts page
        Then I see the "SAVED DRAFTS" table title and headers
        And the page should be accessible

    Scenario: Verify the Saved drafts table content
        Given I have navigated to the TSD drafts page
        Then I see the TSD drafts page
        Then I see the "SAVED DRAFTS" table content


    Scenario: Verify pagination
        Given I have navigated to the TSD drafts page
        And Prepare pagination data
        Then I see the TSD drafts page
        Then I can use the pagination of the "SAVED DRAFTS" table

    Scenario: Display the Saved drafts Page when there are no records
        Given I have navigated to the TSD drafts page when there are no records
        Then I see the TSD drafts page
        And I can see the message with No data
        And the page should be accessible


    Scenario: Verify Action menu options
        Given I have navigated to the TSD drafts page
        Then I see the action options


    Scenario: Verify Edit functionality
        Given I have navigated to the TSD drafts page
        When I click edit button
        Then I see the Edit Declaration General Info page


    Scenario: Verify Delete functionality
        Given I have navigated to the TSD drafts page
        When I click delete button
    #Then record must be deleted


    Scenario: Verify sorting functionality
        Given I have navigated to the TSD drafts page
        And Prepare sorting data
        Then I see the TSD drafts page
        Then I can use the sorting of the "SAVED DRAFTS" table