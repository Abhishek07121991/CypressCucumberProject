@ANPNTS-566 @Functional
Feature: As a user I can enter Declaration General Information data

  Scenario Outline: Display Edit Declaration General Info page
    Given I have navigated to the Edit Declaration General Info page with type <declarationType> and <reuse>
    Then the page should be accessible
    Examples:
      | declarationType | reuse |
      | prelodged       | false |
      | prelodged       | true  |
      | combined        | false |
      | combined        | true  |

  Scenario: Enter valid general information for combined tsd with no reuse
    As a user I can enter valid Declaration General Information data for declaration type combined and false
    I can navigate to the next page of the wizard

    Given I have navigated to the Edit Declaration General Info page with type prelodged and false
    When I enter a valid LRN
    And I select a valid Supervising Customs Office
    And I enter Arrival Transport Means 'Train number' and identification 'ABC'
    And I select Location Type 'B - Authorised place' with Qualifier 'U - UNLOCODE'
    And I select UN Location Code 'BEZAVA00710'
    And I click on the 'next' button
  # Then I navigated to the edit parties page


  Scenario Outline: LRN is required to proceed to next step for type <declarationType> - <reuse> resuse
    Given I have navigated to the Edit Declaration General Info page with type <declarationType> and <reuse>
    When I click on the 'next' button
    Then an error is shown for the LRN field
    Examples:
      | declarationType | reuse |
      | prelodged       | false |
      | combined        | true  |

  Scenario: Check required fields show error for type combined
    Given I have navigated to the Edit Declaration General Info page with type combined and false
    When I click all the mandatory fields
    Then I see all required fields in error

  Scenario: Validate helper text messages for different fields on the General information page for prelodged
    Given I have navigated to the Edit Declaration General Info page with type prelodged and false
    Then I verify the helper text at different fields for Prelodged TSD


  Scenario: Validate helper text messages for different fields on the General information page for combined
    Given I have navigated to the Edit Declaration General Info page with type combined and true
    Then I verify the helper text at different fields for Combined TSD

  Scenario: Verify max length of fields for different fields on the General information page
    Given I have navigated to the Edit Declaration General Info page with type prelodged and false
    When I enter more data than allowed in each field marked with maximum characters
    Then I see that the input is trimmed upto the maximum allowed limit for that field


  Scenario Outline: Check save data functionality on the General information page for type <declarationType> - <reuse> reuse
    Given I have navigated to the Edit Declaration General Info page with type <declarationType> and <reuse>
    When I fill in the mandatory fields
    And I click on Save
    Then no errors are shown
    #And all data is saved correctly  -> verify if api call is made to save master consignment item
    Examples:
      | declarationType | reuse |
      | prelodged       | false |
      | combined        | true  |

  Scenario: Check navigation on next action on the General information page
    Given I have navigated to the Edit Declaration General Info page with type combined and true
    When I fill in all required fields
  #And I click on Next
  #Then no errors are shown in sidebar
  #And all data is saved correctly  -> verify if api call is made to save master consignment info
  #And the xxx page is shown


  Scenario: Check cancel action on the General information page
    Given I have navigated to the Edit Declaration General Info page with type prelodged and false
    When I fill in all required fields
  #When I click on Cancel
  #Then all the form fields get clear

  Scenario: Enter valid general information for type prelodged and true reuse when location of goods is "A" and  Qualifier is "U"
    As a user I can enter valid Declaration General Information data for declaration type prelodged and for both reuse true and false
    I can navigate to the next page of the wizard
    Given I have navigated to the Edit Declaration General Info page with type prelodged and true
    When I enter a valid LRN
    And I select a valid Supervising Customs Office
    And I enter Arrival Transport Means 'Train number' and identification 'ABC'
    And I select Location Type 'A - Designated location' with Qualifier 'U - UNLOCODE'
    And I select UN Location Code 'BEZAVA00710'

  Scenario: Enter valid general information for type combined and true reuse When location of goods is "C" and Qualifier is "V"
    As a user I can enter valid Declaration General Information data for declaration type combined and reuse for both true
    I can navigate to the next page of the wizard
    Given I have navigated to the Edit Declaration General Info page with type combined and true
    When I enter a valid LRN
    And I select a valid Supervising Customs Office
    And I enter Arrival Transport Means 'Train number' and identification 'ABC'
    And I select Location Type 'C - Approved place' with Qualifier 'V - Customs office'
    And I enter customs office reference number 'BE212000 - Zaventem D'

  Scenario: Enter valid general information for type combined and false reuse When location of goods is "D" and Qualifier is "W"
    As a user I can enter valid Declaration General Information data for declaration type combined and reuse for both true
    I can navigate to the next page of the wizard
    Given I have navigated to the Edit Declaration General Info page with type combined and false
    When I enter a valid LRN
    And I select a valid Supervising Customs Office
    And I enter Arrival Transport Means 'Train number' and identification 'ABC'
    And I select Location Type 'D - other' with Qualifier 'W - GNSS'
    And I enter gnss longitude "5.777777"
    And I enter gnss lattitude "08.8777888"
    And I select Warehouse type "V - Storage facilities for the temporary storage of goods"
    And I enter Warehouse Identifier "1122334455"

  Scenario: Enter valid general information for type combined and reuse false  When location of goods is "D" and Qualifier is "X"
    As a user I can enter valid Declaration General Information data for declaration type combined and reuse for both true
    I can navigate to the next page of the wizard
    Given I have navigated to the Edit Declaration General Info page with type combined and false
    When I enter a valid LRN
    And I select Location Type 'D - other' with Qualifier 'X - Economic operator'
    And I enter Economic Operator EORI "BE0214596464"
    And I enter street and number "civil lines 5/3"
    And I select country "AE"
    And I enter city "Dubai"
    And I enter postcode "110042"
    And I select Warehouse type "V - Storage facilities for the temporary storage of goods"
    And I enter Warehouse Identifier "1122334455"
    And I click on the 'next' button
  #Then no errors are shown in sidebar
  #And all data is saved correctly  -> verify if api call is made to save master consignment info
  #And the xxx page is shown

  Scenario: Enter valid general information for type combined and reuse When location of goods is "D" and Qualifier is "Y"
    As a user I can enter valid Declaration General Information data for declaration type combined and reuse for both true
    I can navigate to the next page of the wizard
    Given I have navigated to the Edit Declaration General Info page with type combined and true
    When I enter a valid LRN
    And I select Location Type 'D - other' with Qualifier 'Y - Authorisation number'
    And I enter Authorization number "1234567890"
    And I enter street and number "civil lines 5/3"
    And I select country "United Arab Emirate"
    And I enter city "Dubai"
    And I enter postcode "110042"
    And I select Warehouse type "V - Storage facilities for the temporary storage of goods"
    And I enter Warehouse Identifier "1122334455"

  Scenario: Check errors on address fields on location of goods section for type combined and false
    Given I have navigated to the Edit Declaration General Info page with type combined and false
    And I select Location Type 'D - other' with Qualifier 'Y - Authorisation number'
    And I click all the mandatory fields for address section on location of goods
    Then I see all required fields in error for address section

  Scenario: Check Values of qualifiers when type of location of Goods is 'A' for type prelodged and true
    Given I have navigated to the Edit Declaration General Info page with type prelodged and true
    And I select Location Type 'A - Designated location'
    Then I see Qualifier 'U - UNLOCODE'
    And I see Qualifier 'V - Customs office'


  Scenario: Check Values of qualifiers when type of location of Goods is 'B' for type prelodged and reuse false
    Given I have navigated to the Edit Declaration General Info page with type prelodged and false
    And I select Location Type 'B - Authorised place'
    Then I see Qualifier 'U - UNLOCODE'

  Scenario: Check Values of qualifiers when type of location of Goods is 'C' for type combined and reuse false
    Given I have navigated to the Edit Declaration General Info page with type combined and false
    And I select Location Type 'C - Approved place'
    Then I see Qualifier 'U - UNLOCODE'
    And I see Qualifier 'V - Customs office'

  Scenario: Check Values of qualifiers when type of location of Goods is 'D' for type combined and reuse true
    Given I have navigated to the Edit Declaration General Info page with type combined and true
    And I select Location Type 'D - other'
    Then I see Qualifier 'U - UNLOCODE'
    And I see Qualifier 'V - Customs office'
    Then I see Qualifier 'W - GNSS'
    And I see Qualifier 'X - Economic operator'
    And I see Qualifier 'Y - Authorisation number'

  Scenario: Check cancel action on the General information page with saved changes
    Given I have navigated to the Edit Declaration General Info page with type prelodged and false
    And I click on Cancel
    Then I navigate to home screen

  Scenario: Check cancel action on the General information page with unsaved changes
    Given I have navigated to the Edit Declaration General Info page with type prelodged and false
    When I fill in all required fields
    And I click on Cancel
    And I see unsaved changes dialog
    And I click on cancel without saving
    Then I navigate to home screen

  Scenario: Check cancel action on the General information page with unsaved changes
    Given I have navigated to the Edit Declaration General Info page with type prelodged and false
    When I fill in all required fields
    And I click on Cancel
    And I see unsaved changes dialog
    And I click on save changes
    Then I navigate to home screen

  Scenario: Check cancel action on the General information page without entering lrn
    Given I have navigated to the Edit Declaration General Info page with type prelodged and false
    When I fill in location type without providing lrn
    And I click on Cancel
    And I see unsaved changes dialog
    And I click on save changes without lrn
    Then I see message dialog as lrn is not provided
