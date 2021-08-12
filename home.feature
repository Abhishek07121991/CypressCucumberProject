@Functional
Feature: Home page

  Background:
    Given I have navigated to the Home Page

  Scenario: The home page should be visible
    Then the home page should be visible
    And the page should be accessible
