@ANPNTS-596
Feature: Navigation menu - Quick search
    As an Economic operator / Customs officer
    I want to search on MRN or CRN
    so that I am directly taken to the consult screens of the corresponding TSD

    Background:
        Given Set mock data
        Given I have navigated to the Home Page
        Then the home page should be visible

    Scenario: Search data with MRN or CRN by pressing enter when there is records
        When I search with valid MRN or CRN by pressing enter
        And Overlay is hidden
        Then I move to the general information page

    Scenario: Search data with MRN or CRN by clicking loop icon button when there is records
        When I search with valid MRN or CRN by clicking loop icon button
        And Overlay is hidden
        Then I move to the general information page

    Scenario: Search data with MRN or CRN by pressing enter when there is no records
        When I search with invalid MRN or CRN by pressing enter
        And Overlay is hidden
        Then I move to the Advanced search page
        And I can see the breadcrumb
        And I can see the error message
        And I can see all the fields on the Advanced search page
        And the page should be accessible


    Scenario: Search data with MRN or CRN by clicking loop icon button when there is no records
        When I search with invalid MRN or CRN by clicking loop icon button
        And Overlay is hidden
        Then I move to the Advanced search page
        And I can see the breadcrumb
        And I can see the error message
        And I can see all the fields on the Advanced search page
