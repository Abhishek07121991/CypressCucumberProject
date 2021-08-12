@ANPNTS-564 @Functional
Feature: New declaration - Question Wizard
  As an economic operator / customs officer
  I want to specify which type of temporary storage declaration that I would like to declare
  so that only relevant information is required and I don't have to share abundant information during the creation of a temporary storage declaration

  Background:
    Given I have navigated to the Question Wizard page


  Scenario: Display Question Wizard page
    When I click the New Declaration menu
    Then the Question Wizard page is displayed
    And the page should be accessible
  # And the hover icons are working ??

  Scenario Outline: Create <type> declaration with ens reuse and <consignments> consignments
    When I select temporary storage declaration type "<type>"
    And I select Re-use consignment details from ENS "yes"
    And I select type of ENS consignment data "<consignments>"
    And I click start declaration
    Then The edit declaration wizard is started
    # The correct elements are shown for type "<type>" ens reuse "yes" and consingment "<consignments>"
    Examples:
      | type      | consignments |
      | combined  | master       |
      | combined  | house        |
      | prelodged | house        |
      | prelodged | both         |

  Scenario Outline: Create <type> declaration without ens reuse and <consignments> consignments
    When I select temporary storage declaration type "<type>"
    And I select Re-use consignment details from ENS "no"
    And I select type of consignment data "<consignments>"
    And I click start declaration
    Then The edit declaration wizard is started
    # The correct elements are shown for type "<type>" ens reuse "yes" and consingment "<consignments>"
    Examples:
      | type      | consignments |
      | combined  | house        |
      | prelodged | master       |

  Scenario Outline: Create <type> declaration without ens reuse and both consignments with items added to <additemsto>
    When I select temporary storage declaration type "<type>"
    And I select Re-use consignment details from ENS "no"
    And I select type of consignment data "both"
    And I select consignment items added to "<additemsto>"
    And I click start declaration
    Then The edit declaration wizard is started
    # The correct elements are shown for type "<type>" ens reuse "yes" and consingment "<consignments>"
    Examples:
      | type      | additemsto |
      | combined  | master     |
      | prelodged | house      |
      | prelodged | both       |


  Scenario: Validation error when no question is answered
    When I click start declaration
    Then An error is shown for the type and ENS sections
    And I stay on the same Question Wizard page

  Scenario: Validation error when only type and ens questions are answered
    When I select temporary storage declaration type "combined"
    And I select Re-use consignment details from ENS "no"
    And I click start declaration
    Then An error is shown for the type of consignment section
    And I stay on the same Question Wizard page

  Scenario: Validation error when only type and ens questions are answered
    When I select temporary storage declaration type "combined"
    And I select Re-use consignment details from ENS "yes"
    And I click start declaration
    Then An error is shown for the type of ens consignment section
    And I stay on the same Question Wizard page

  Scenario: Validation error when only declaration type and ens questions and consignment type questions are answered
    When I select temporary storage declaration type "combined"
    And I select Re-use consignment details from ENS "no"
    And I select type of consignment data "both"
    And I click start declaration
    Then An error is shown for the consignment item section
    And I stay on the same Question Wizard page