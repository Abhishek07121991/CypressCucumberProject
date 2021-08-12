@ANPNTS-564 @Functional
Feature: Login Page
  As an economic operator / customs officer
  I want to be able to authenticate me to the application so that I can access it.


  Scenario: Succesful login as an economic operator
    Given I am at the login page
    When I as Economic Operator sign in with the correct credentials
    Then I should see the Home Page

  Scenario: Succesful login as an customs officer
    Given I am at the login page
    When I as Customs Officer sign in with the correct credentials
    Then I should see the Home Page

  @pending
  #todo implement
  Scenario: Failed login with invalid credentials
    Given I am at the login page
    When I enter the wrong credentials
    Then I should see an invalid password message