@ANPNTS-605
Feature: Standard Navigation Drawer
    As an economic operator
    I want to be able to navigate through the temporary storage declaration data and perform actions
    so that I can consult, invalidate, amend, export or copy data

    Background: setup mock data
        Given Prepare mock data for standard navigation drawer


    Scenario: Navigation to Consult declaration page
        Given I have navigated to consult declaration page
        Then I see general information page
        And the current status is displayed with colored icon on the navigation drawer
        And the navigation drawer contains Reference Number
        And the page should be accessible
        And all sections are displayed on the navigation drawer

    Scenario Outline: Verify actions <Actions> for status <Status>
        Given I Prepare mock data for standard navigation drawer with status <Status>
        And I have navigated to consult declaration page for <Status>
        When I click on actions icon for status <Status> at navigation drawer
        Then I see actions <Actions> corresponding to status
        And I see "<Color>" colored icon for status <Status>
        Examples:
            | Status                           | Actions                                                                                               | Color  |
            | Accepted                         | Request for amendment, Re-use data to create new declaration, Export to PDF                           | green  |
            | Pre-lodged                       | Request for amendment, Request for invalidation, Re-use data to create new declaration, Export to PDF | orange |
            | Irregularity under investigation | Re-use data to create new declaration, Export to PDF                                                  | orange |

    Scenario Outline: Navigation to tsd pages from actions menu
        Given I Prepare mock data for standard navigation drawer with status <Status>
        And I have navigated to consult declaration page for <Status>
        When I click on actions icon for status <Status> at navigation drawer
        And I click on menu item <Item> for status <Status>
        Then I see page is displayed for the <Item> item
        Examples:
            | Status                           | Item                                  |
            | Accepted                         | Request for amendment                 |
            | Pre-lodged                       | Request for invalidation              |
            | Irregularity under investigation | Re-use data to create new declaration |
            | Accepted                         | Export to PDF                         |

    Scenario: Navigation between sub-tabs available under Declaration Information
        Given I have navigated to general information page
        When I click on "Declaration Information" tab
        And I click on "Parties" sub-tab under "Declaration Information" section
        Then I see "Parties" sub-tab selected under "Declaration Information" and "Parties" page is displayed
        And I can navigate back to "General information" sub-tab under "Declaration Information" section
        And I see "General Information" page


    Scenario: Navigation between sub-tabs available under Presentation Notification
        Given I have navigated to general information page
        When I click on "Presentation Notification" tab
        And I click on "Parties" sub-tab under "Presentation Notification" section
        Then I see "Parties" sub-tab selected under "Presentation Notification" and "PARTIES" page is displayed
        And I can navigate back to "General information" sub-tab under "Declaration Information" section
        And I see "General Information" page

    Scenario: Navigation between sub-tabs available under Consignment Information
        Given I have navigated to general information page
        When I click on "Consignment Information" tab
        And I click on "House Consignment(s)" sub-tab under "Consignment Information" section
        Then I see "House Consignment(s)" sub-tab selected under "Consignment Information" and " House Consignment " page is displayed
        And I can navigate back to "Master Consignment" sub-tab under "Consignment Information" section

    Scenario: Naigation to event history page
        Given I have navigated to general information page
        When I click on "History" tab
        Then I see "History" page is displayed

    Scenario: Naigation to status history page
        Given I have navigated to general information page
        When I click on status displayed at navigation drawer
        Then I see "Status" page is displayed


