@ANPNTS-569 @Functional
Feature: Master consignment - Items
  As an economic operator / customs officer
  I want to enter all necessary master consignment item information
  so that  I can fulfill my customs obligations by sharing all required data elements for placing goods under temporary storage procedure

  Background: Prepare codelist data
    Given mock data setup

  @focus
  Scenario Outline: Check Accessability
    Given I have navigated to the master consignment item page with "<declarationType>", "<consignorTypeOfPerson>" and "<consigneeTypeOfPerson>"
    When I check all sections
    Then I see the master consignment item page with all sections checked
    And the page should be accessible
    Examples:
      | declarationType | consignorTypeOfPerson | consigneeTypeOfPerson |
      | Prelodged       | 2                     | 1                     |
      | Combined        | 1                     | 1                     |


  Scenario Outline: Verify sections are visible as expected
    Given I have navigated to the master consignment item page with "<declarationType>", "<consignorTypeOfPerson>" and "<consigneeTypeOfPerson>"
    Then The previous document type is correctly populated for "<declarationType>"
    And The comodity code section is correctly visible for "<consignorTypeOfPerson>" and "<consigneeTypeOfPerson>"
    Examples:
      | declarationType | consignorTypeOfPerson | consigneeTypeOfPerson |
      | Prelodged       | 1                     | 1                     |
      | Combined        | 1                     | 1                     |

  Scenario: Verify max length of fields
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    When I check all sections
    And I try to enter more data than allowed in each field marked with max characters
    Then I see that the input is trimmed upto the maximum allowed limit for that field

  Scenario: Verify fields that allow only numbers
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    When I check all sections
    And I try to enter non numeric data in numeric only fields
    Then I see that non numeric characters are trimmed and only numeric characters are entered

  Scenario Outline: Check save data
    Given I have navigated to the master consignment item page with "<declarationType>", "<consignorTypeOfPerson>" and "<consigneeTypeOfPerson>"
    When I fill in all required fields
    When I click on Save
    Then no errors are shown
    #And all data is saved correctly  -> verify if api call is made to save master consignment item
    Examples:
      | declarationType | consignorTypeOfPerson | consigneeTypeOfPerson |
      | Prelodged       | 2                     | 2                     |
      | Prelodged       | 1                     | 1                     |
      | Combined        | 2                     | 2                     |
      | Combined        | 1                     | 1                     |


  Scenario Outline: Check navigation on next action
    Given I have navigated to the master consignment item page with "<declarationType>", "<consignorTypeOfPerson>" and "<consigneeTypeOfPerson>"
    When I fill in all required fields
    #And I click on Next
    #Then no errors are shown in sidebar
    #And all data is saved correctly  -> verify if api call is made to save master consignment info
    #And the xxx page is shown
    Examples:
      | declarationType | consignorTypeOfPerson | consigneeTypeOfPerson |
      | Prelodged       | 2                     | 2                     |
      | Prelodged       | 1                     | 1                     |
      | Combined        | 2                     | 2                     |
      | Combined        | 1                     | 1                     |

  Scenario Outline: Check cancel action for <declarationType>, <consignorTypeOfPerson> and <consigneeTypeOfPerson> with unsaved changes
    Given I have navigated to the master consignment item page with "<declarationType>", "<consignorTypeOfPerson>" and "<consigneeTypeOfPerson>"
    When I fill in all required fields
    And I click on Cancel
    And I see unsaved changes dialog
    And I click on cancel without saving
    Then I navigate to home screen
    Examples:
      | declarationType | consignorTypeOfPerson | consigneeTypeOfPerson |
      | Prelodged       | 2                     | 2                     |
      | Prelodged       | 1                     | 1                     |
      | Combined        | 2                     | 2                     |
      | Combined        | 1                     | 1                     |

  Scenario Outline: Check cancel action for <declarationType>, <consignorTypeOfPerson> and <consigneeTypeOfPerson> with unsaved changes
    Given I have navigated to the master consignment item page with "<declarationType>", "<consignorTypeOfPerson>" and "<consigneeTypeOfPerson>"
    When I fill in all required fields
    And I click on Cancel
    And I see unsaved changes dialog
    And I click on save changes
    Then I navigate to home screen
    Examples:
      | declarationType | consignorTypeOfPerson | consigneeTypeOfPerson |
      | Prelodged       | 2                     | 2                     |
      | Prelodged       | 1                     | 1                     |
      | Combined        | 2                     | 2                     |
      | Combined        | 1                     | 1                     |

  Scenario Outline: Check cancel action for <declarationType>, <consignorTypeOfPerson> and <consigneeTypeOfPerson> with saved changes
    Given I have navigated to the master consignment item page with "<declarationType>", "<consignorTypeOfPerson>" and "<consigneeTypeOfPerson>"
    And I click on Cancel
    Then I navigate to home screen
    Examples:
      | declarationType | consignorTypeOfPerson | consigneeTypeOfPerson |
      | Prelodged       | 2                     | 2                     |
      | Prelodged       | 1                     | 1                     |
      | Combined        | 2                     | 2                     |
      | Combined        | 1                     | 1                     |

  Scenario Outline: Verify add item functionality in sections
    Check for each section where you can add items that a new item can be added and that the existing item is collapsed and the new items is expanded
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    When I check section and click on the add item button of section "<section>"
    Then I see 2 items in "<section>"
    And I see "<item> 1" in section "<section>" is collapsed
    And I see "<item> 2" in section "<section>" is expanded
    Examples:
      | item                   | section                       |
      | CONTAINER              | Transport Equipment           |
      | SUPPORTING DOCUMENT    | Supporting Document           |
      | ADDITIONAL INFORMATION | Additional Information        |
      | ADDITIONAL REFERENCE   | Additional Reference          |
      | ACTOR                  | Additional Supply Chain Actor |

  Scenario Outline: Verify delete <item> functionality in section <section>
    Check for each section where you can delete items that an item can be deleted and that you cannot delete the last item. And test that the items are renumbered after a delete.
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    When I check section and click on the add item button of section "<section>"
    And I click on the delete item button from item "<item> 1" in "<section>"
    Then I see 1 items in "<section>"
    And I see "<item> 1" in section "<section>" is expanded
    And I see "<item> 1" in section "<section>" does not have a delete button
    Examples:
      | item                   | section                       |
      | CONTAINER              | Transport Equipment           |
      | SUPPORTING DOCUMENT    | Supporting Document           |
      | ADDITIONAL INFORMATION | Additional Information        |
      | ADDITIONAL REFERENCE   | Additional Reference          |
      | ACTOR                  | Additional Supply Chain Actor |

  Scenario: Verify Commodity section
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    When I enter a valid Commodity description "Test Commodity description"
    And I enter a valid CUS Code "0021238-4 - Oxalic acid in anhydrous form (CN 2917 11 00)"
    Then no errors are shown


  Scenario: Verify Commodity Code section for <Harmonized Code> and <combined nomenclature>
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    When I enter a valid Harmonized Code "test1234"
    Then no errors are shown

  Scenario Outline: Verify Packaging section for <Type> and <Number>, <Shipping Marks>
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    When I enter a valid "<Type>" and "<Number>", "<Shipping Marks>"
    Then no errors are shown
    Examples:
      | Type | Number | Shipping Marks      |
      | 1A   | 2      | Test shipping marks |
      | 1D   | 3      | Test shipping marks |

  Scenario Outline: Verify Weight section for <Gross  Mass>
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    When I enter a valid "<Gross  Mass>"
    Then no errors are shown
    Examples:
      | Gross  Mass |
      | 12.45       |
      | 1.455645    |

  Scenario Outline: Verify Previous Document section for <Type> and <Reference number>
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    When I enter a valid Previous Document with "<Type>" and "<Reference Number>"
    Then no errors are shown
    Examples:
      | Type                             | Reference Number      |
      | N355 - Entry Summary Declaration | 1565565665677777T6767 |

  Scenario Outline: Verify Transport Equipment section for <Container packed status>
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    When I check section "Transport Equipment"
    And I enter a valid transport equipment with Container packed status "<Container packed status>"
    Then no errors are shown
    Examples:
      | Container packed status |
      | A - Empty               |
      | B - Not empty           |

  Scenario Outline: Verify Supporting Document section for <Type> and <Reference number>
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    And I check section "Supporting Document"
    When I enter a valid Supporting Document with "<Type>" and "<Reference Number>"
    Then no errors are shown
    Examples:
      | Type                                                            | Reference Number      |
      | A001 - Certificate of authenticity fresh 'EMPEROR' table grapes | 1565565665677777T6767 |
      | A004 - Certificate of authenticity Tobacco                      | 1565565665677777J6767 |

  Scenario Outline: Verify Additional Information section for <Text>
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    And I check section "Additional Information"
    When I enter a valid Additional Information with "<Text>"
    Then no errors are shown
    Examples:
      | Text                       |
      | Any Additional information |

  Scenario Outline: Verify Additional reference section for <Type> and <Reference number>
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    And I check section "Additional Reference"
    When I enter a valid Additional Reference with "<Type>" and "<Reference Number>"
    Then no errors are shown
    Examples:
      | Type                                                | Reference Number      |
      | Seal (fixed to each piece) and directly transported | 1565565665677777T6767 |
      | Transported directly from Turkey to the Community   | 1565565665677777T6767 |

  Scenario Outline: Verify Additional Supply Chain Actor section for <EORI> and <Role>
    Given I have navigated to the master consignment item page with "combined", "2" and "1"
    And I check section "Additional Supply Chain Actor"
    When I enter a valid Additional Supply Chain Actor with "<EORI>" and "<Role>"
    Then no errors are shown
    Examples:
      | EORI         | Role              |
      | BE0214596464 | CS - Consolidator |
      | BE0427599358 | MF - Manufacturer |
