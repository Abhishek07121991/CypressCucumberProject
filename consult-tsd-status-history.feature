@ANPNTS-604
Feature: Consult TSD Status History
  I want see the status of the consulted declaration
  so that I can track the condition of the declaration in real time

  Background: Prepare declaration test data
    Given Prepare status history test mock data
    And I am on status history page

  Scenario: Navigation from status link to Status History page
    When I choose search option
    And search with valid MRN or LRN
    And I click on status link on stepper
    Then I see Status History page
    And current status is displayed with icon
    And the page should be accessible

  Scenario: Validate components in timeline
    Then I see Status History page
    And I see check icon inside current status icon
    And statuses are displayed in descending chronological order
    And I see time is displayed
    And I see the status description for each status reason
    And tool tip is displayed on hover

