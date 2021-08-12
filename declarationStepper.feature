@ANPNTS-578 @Functional
Feature: New declaration - Stepper
  As an economic operator / customs officer
  I want to know where I am in the submission process
  so that I can track my progress
  Background: setup mock data
    Given prepare mock for declare general information screen

  @focus
  Scenario Outline: Display New declaration stepper
    When I navigate to the  declaration general information page for a declaration with consignments on "<consignment>" and items on "<items>"
    Then I see the declaration stepper
    #And I see "<consignment>" consignment sections with items sections only available on "<items>"
    #And the "<consignment>" items page should be accessible
    Examples:
      | consignment | items |
      | House       | House |
  # | Master      | Master |
  # | Both        | Master |
  # | Both        | House  |
  # | Both        | Both   |


  Scenario: Validate that Declarant EORI is entered to proceed to next step
    When I have navigated to the "declaration" "general information" page
    And I enter value of LRN
    And I click on "parties" in the stepper for "declaration"
    And I click on "general information" in the stepper for "declaration"
    Then An error is shown for the  Declarant EORI text field
    And I stay on the same "Declaration" "parties" page

  Scenario: Validate that LRN is entered to proceed to next step
    Given I have navigated to the "declaration" "general information" page
    When I click on "parties" in the stepper for "declaration"
    Then An error is shown for the  LRN text field
    And I stay on the same "Declaration" "general information" page


  Scenario Outline: Validate that new step is added when click on Add step button
    Given I have navigated to the "declaration" "general information" page
    When I click "2" times on add item button in "<consignment>" consignments section
    Then I see an item with name Item "1" in the "<consignment>" consignments section
    And I see an item with name Item "2" in the "<consignment>" consignments section
    And I stay on the same "Items" "<consignment>" page
    Examples:
      | consignment |
      | House       |
      | Master      |


  Scenario Outline:  Validate that an item can be deleted from the <consignment> consignment items
    Given I have navigated to the "declaration" "general information" page
    When I click "2" times on add item button in "<consignment>" consignments section
    And I delete "Item 2" of the "<consignment>" consignments
    Then I see an item with name Item "1" in the "<consignment>" consignments section
    And I go to Item 1 page
    Examples:
      | consignment |
      | House       |
      | Master      |


  Scenario Outline: Validation error when Mandatory parameters and right information is not filled to move to next step
    Given I have navigated to the "<consignment>" "general information" page
    When I click on "parties" in the stepper for "<consignment>"
    Then "<consignment>" consignment "general information" option goes to error state
    And "<consignment>" consignment "general information" option goes to in progress state
    And "<consignment>" consignment parties step is activated
    Examples:
      | consignment |
      | master      |
      | house       |


  Scenario Outline: Mandatory parameters and right information is filled to move to next step
    Given I have navigated to the "<consignment>" "general information" page
    And I enter all correct mandatory values in general information form
    When I click on "parties" in the stepper for "<consignment>"
    Then "<consignment>" consignment "general information" option goes to editable state
    And "<consignment>" consignment parties step is activated
    Examples:
      | consignment |
      | master      |
      | house       |

  Scenario: Validate that House consignment is added on clicking add house consignment
    Given I have navigated to the "declaration" "general information" page
    When I click on add house consignment button in stepper
    Then I see consignment with name House Consignment "2" in the house consignments section
    And I see delete house consignment button in the page

  Scenario: Validate that House consignment is deleted on clicking delete house consignment
    Given I have navigated to the "declaration" "general information" page
    When I click on add house consignment button in stepper
    And I click on delete House consignment 2 button in page
    Then  I see consignment with name House Consignment "1" in the house consignments section
    And I go to House consignment 1 page


#To be implemented after submit button integration
# Scenario Outline: Validate that No progress error state is shown
#   Given that "<consignment>" consignments step 1 is active, Items step 1 is complete and Items step 2 is active
#   When I click on Submit button
#   Then "<consignment>" consignments step2 and step 3 changes to error state
#   Examples:
#     | consignment |
#     | House        |
#     | Master       |


#To do, depends on API call: existing draft declarations can be correctly shown
#To do, depends on API call:the error state is saved and shown when reopening a draft
