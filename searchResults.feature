@ANPNTS-595 @Functional
Feature: TSD Advanced search - Search results
    As an economic operator / customs officer
    I want to see all general data on the search results page

    Scenario: Display the Search results screen with records
        Given I have navigated to the Search result page
        When I see the search result page
        Then I see the "SEARCH RESULT" table title and headers
        And Overlay is hidden
        And the page should be accessible


    Scenario: Display the Search results screen with records when all the search parameters are filled
        Given I have navigated to the Search result page when all the search parameters are filled
        When I see the search result page
        Then I see the "SEARCH RESULT" table title and headers
        And I can verify the url with all the parameters

    
    Scenario: Verify the Search results table content
        Given I have navigated to the Search result page
        Then I see the search result page
        Then I see the "SEARCH RESULT" table content
        
    Scenario: Verify pagination and sorting
        Given I have navigated to the Search result page
        And Prepare pagination and sorting data
        Then I see the search result page
        Then I can use the pagination of the "SEARCH RESULT" table
        And I can use the sorting of the "SEARCH RESULT" table



    Scenario: Display the Search Results Page when there is no records
        Given I have navigated to the Search result page with no records
        Then I see the search result page
        And I can see the message with No data
        And the page should be accessible

    Scenario: Verify Refine Search functionality
        Given I have navigated to the Search result page with no records
        Then I see the search result page
        And I click on the Refine Search button
        And I moved back to the Advanced search page
        And I validate all search parameters are filled in


    Scenario Outline: Verify Action menu options
        Given I have navigated to the Search result page
        Then I see the action options "<actions>" for first item with status "<status>"
        Examples:
            | status                           | actions                                                                                          |
            | Pre-lodged                       | View,Request for amendment,Request for invalidation,Re-use data to create new declaration,Export |
            | Accepted                         | View,Request for amendment,Re-use data to create new declaration,Export                          |
            | Invalidated                      | View,Re-use data to create new declaration,Export                                                |
            | Irregularity under investigation | View,Re-use data to create new declaration,Export                                                |

    Scenario: Verify functionality for View section
        Given I have navigated to the Search result page
        When I select "View" option from the action menu of the first item with status "Accepted"
        Then I can see the consult screen for mrn "20BETP000000C3FLU42"

    Scenario: Verify Request for amendment functionality
        Given I have navigated to the Search result page
        When I select "Request for amendment" option from the action menu of the first item with status "Accepted"
    #Then I can see the navigation drawer


    Scenario: Verify Request for invalidation functionality
        Given I have navigated to the Search result page
        When I select "Request for invalidation" option from the action menu of the first item with status "Pre-lodged"
    #Then I can see the navigation drawer

    Scenario: Verify Re-use data to create new declaration functionality
        Given I have navigated to the Search result page
        When I select "Re-use data to create new declaration" option from the action menu of the first item with status "Invalidated"
    #TODO: new screen yet to be decided


    Scenario: Verify Export functionality
        Given I have navigated to the Search result page
        When I select "Export" option from the action menu of the first item with status "Invalidated"
#TODO: Not in scope


