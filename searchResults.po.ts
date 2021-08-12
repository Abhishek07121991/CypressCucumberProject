//import { DeclarationType, EnsReuse } from '../common/customTypes';

export class SearchResultsPage {
  navigateAdvancedSearchPage() {
    cy.loginWithEO();
    cy.visit('/advanced-search');
  }
  isVisible() {
    cy.location('pathname').should('contain', '/search-results');
  }
  getOverlay() {
    return cy.get('.custom-overlay');
  }
  isAdvanceSearchPageVisible() {
    cy.location('search').should(
      'eq',
      '?registrationDateAfter=2021-06-15T18:30:00.000Z&registrationDateBefore=2021-06-14T18:30:00.000Z'
    );
  }
  getRegistrationBeforeDate() {
    return cy.get('[data-testid="registrationDateBefore"');
  }
  getRegistrationAfterDate() {
    return cy.get('[data-testid="registrationDateAfter');
  }
  isConsultScreenVisible(mrn: string) {
    cy.location('pathname').should(
      'eq',
      '/advanced-search/search-results/' + mrn
    );
  }
  visit() {
    cy.loginWithEO();
    cy.visit(
      '/advanced-search/search-results?registrationDateAfter=2021-06-15T18:30:00.000Z&registrationDateBefore=2021-06-14T18:30:00.000Z'
    );
  }
  visitWithAllParameters() {
    cy.loginWithEO();
    cy.visit(
      '/advanced-search/search-results?registrationDateAfter=2021-06-04T18:30:00.000Z&registrationDateBefore=2021-06-02T18:30:00.000Z&status=prelodged,accepted,irregularity,invalidated&presentationDateBefore=2021-06-09T18:30:00.000Z&presentationDateAfter=2021-06-24T18:30:00.000Z&lrn=1234567890&arrivalTransportMeans=Test12345&declarant=&representative=&carrier=&personPresentingTheGoods=&transportDocument=12345678&containerOrReceptacle=REF123&supervisingOfficeRefNum=BE212000&presentationOfficeRefNum=BE212000'
    );
  }
  getSearchResultTitle(): any {
    return cy.get('[data-testid=searchResult]');
  }
  getMessage(): any {
    return cy.get('[data-testid=noRecord]');
  }
  getRefineSearch(): Cypress.Chainable<any> {
    return cy.get('#refineSearch');
  }
  tableSelectors = {
    'SEARCH RESULT': '[data-testid=searchResult]'
  };

  getTable(title): any {
    return cy.get(this.tableSelectors[title]);
  }
  getMenu(): Cypress.Chainable<any> {
    return cy.get('.mat-menu-item');
  }
  getActionIcon(row: number) {
    return cy.get('#action' + row);
  }
  getFirstRowAction(status: string) {
    return cy
      .get('tr:contains(' + status + ')')
      .first()
      .find('app-tsd-action');
  }
  searchResultPageVisibleWithAllParameters() {
    cy.location('href').should(
      'contain',
      '/advanced-search/search-results?registrationDateAfter=2021-06-04T18:30:00.000Z&registrationDateBefore=2021-06-02T18:30:00.000Z&status=prelodged,accepted,irregularity,invalidated&presentationDateBefore=2021-06-09T18:30:00.000Z&presentationDateAfter=2021-06-24T18:30:00.000Z&lrn=1234567890&arrivalTransportMeans=Test12345&declarant=&representative=&carrier=&personPresentingTheGoods=&transportDocument=12345678&containerOrReceptacle=REF123&supervisingOfficeRefNum=BE212000&presentationOfficeRefNum=BE212000'
    );
  }
}
