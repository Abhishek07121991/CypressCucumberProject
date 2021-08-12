///<reference types = "Cypress"/>
import { Given, When, Then, And } from 'cypress-cucumber-preprocessor/steps';
import { SearchResultsPage } from './searchResults.po';
import { AdvancedSearchPage } from '../searchParameters/searchParameters.po';
import '../common/customTypes';
import { random } from 'faker';
import { columnSort, convertDate } from '../common/util';
import { AdvSearchResultItem } from '@features/advanced-search/models';
const faker = require('faker');

let page = new SearchResultsPage();

let searchList: AdvSearchResultItem[];
let tableHeaders = {
  'SEARCH RESULT': [
    '',
    'MRN/CRN',
    'Registration date and time',
    'Declarant',
    'Representative',
    ' Status',
    'Linked PN (FRN)',
    'Action'
  ]
};

Given('I have navigated to the Search result page', () => {
  cy.fixture('search-results.json').then((data) => {
    searchList = data.items;

    cy.intercept(
      'GET',
      '/api/v1/temporaryStorageDeclarations?registrationDateAfter=2021-06-15T18:30:00.000Z&registrationDateBefore=2021-06-14T18:30:00.000Z',
      data
    );
  });
  cy.intercept(
    'GET',
    '/api/v1/temporaryStorageDeclarations/20BETP000000C3FLU42',
    {
      fixture: 'tsd-declaration.json'
    }
  ).as('declaration');
  page.visit();
});
Given(
  'I have navigated to the Search result page when all the search parameters are filled',
  () => {
    cy.fixture('search-results.json').then((data) => {
      searchList = data.items;

      cy.intercept(
        'GET',
        '/api/v1/temporaryStorageDeclarations?registrationDateAfter=2021-06-04T18:30:00.000Z&registrationDateBefore=2021-06-02T18:30:00.000Z&status=prelodged,accepted,irregularity,invalidated&presentationDateBefore=2021-06-09T18:30:00.000Z&presentationDateAfter=2021-06-24T18:30:00.000Z&lrn=1234567890&arrivalTransportMeans=Test12345&declarant=&representative=&carrier=&personPresentingTheGoods=&transportDocument=12345678&containerOrReceptacle=REF123&supervisingOfficeRefNum=BE212000&presentationOfficeRefNum=BE212000',
        data
      );
    });
    page.visitWithAllParameters();
  }
);

Given('I have navigated to the Search result page with no records', () => {
  cy.fixture('search-results-NoRecords.json').then((data1) => {
    cy.intercept(
      'GET',
      '/api/v1/temporaryStorageDeclarations?registrationDateAfter=2021-06-15T18:30:00.000Z&registrationDateBefore=2021-06-14T18:30:00.000Z',
      data1
    );
  });
  page.visit();
});

And('Prepare pagination and sorting data', () => {
  cy.fixture('search-results-pagination.json').then((data1) => {
    cy.intercept(
      'GET',
      '/api/v1/temporaryStorageDeclarations?after=qoVf3ERK1Mdsd3G5kMTosNTm=',
      data1
    );
  });

  cy.fixture('search-results-sort.json').then((data1) => {
    cy.intercept(
      'GET',
      '/api/v1/temporaryStorageDeclarations?registrationDateAfter=2021-06-15T18:30:00.000Z&registrationDateBefore=2021-06-14T18:30:00.000Z&sort=registrationDate',
      data1
    );
  });

  cy.fixture('search-results.json').then((data1) => {
    cy.intercept(
      'GET',
      '/api/v1/temporaryStorageDeclarations?registrationDateAfter=2021-06-15T18:30:00.000Z&registrationDateBefore=2021-06-14T18:30:00.000Z&sort=-registrationDate',
      data1
    );
  });

  cy.fixture('search-results.json').then((data1) => {
    cy.intercept(
      'GET',
      '/api/v1/temporaryStorageDeclarations?before=MTU3MTY1Mjc4MzAwMToxNzY=',
      data1
    );
  });
  cy.fixture('search-results.json').then((data1) => {
    cy.intercept(
      'GET',
      '/api/v1/temporaryStorageDeclarations?registrationDateAfter=2021-06-15T18:30:00.000Z&registrationDateBefore=2021-06-14T18:30:00.000Z&sort=-registrationDate?pageSize=10',
      data1
    );
  });

  cy.fixture('search-results-sort.json').then((data1) => {
    cy.intercept(
      'GET',
      '/api/v1/temporaryStorageDeclarations?registrationDateAfter=2021-06-15T18:30:00.000Z&registrationDateBefore=2021-06-14T18:30:00.000Z&sort=registrationDate?pageSize=10',
      data1
    );
  });
});

When('I see the search result page', () => {
  page.isVisible();
});

When('Overlay is hidden', () => {
  page.getOverlay().should('not.exist');
});

And('I click on the Refine Search button', () => {
  page.getRefineSearch().click();
});
Then('I moved back to the Advanced search page', () => {
  page.isAdvanceSearchPageVisible();
});
Then('I validate all search parameters are filled in', () => {
  page.getRegistrationBeforeDate().should('have.value', 'Jun 14, 2021');
  page.getRegistrationAfterDate().should('have.value', 'Jun 15, 2021');
});
Then('I can see the message with No data', () => {
  page.getMessage().should('contain', 'No data. Please refine your search');
});
When('I click actions icon of row {string}', (row) => {
  page.getActionIcon(row).click();
});

Then('I can see the consult screen for mrn {string}', (mrn) => {
  page.isConsultScreenVisible(mrn);
});
When('I see actions {} corresponding to status', (Actions) => {
  page.getMenu().should('deep.equal', Actions);
});

When(
  'I select {string} option from the action menu of the first item with status {string}',
  (option, status) => {
    page.getFirstRowAction(status).click();
    page.getMenu().contains(option).click();
  }
);
Then(
  'I see the action options {string} for first item with status {string}',
  (actions, status) => {
    page.getFirstRowAction(status).click();
    let expectedActionList = actions.split(',');
    expectedActionList.forEach((action) => {
      page.getMenu().contains(action);
    });
  }
);
Then('I see the {string} table title and headers', (tableName) => {
  page
    .getTable(tableName)
    .should('contain', tableName)
    .getTableHeadersText()
    .should('deep.equal', tableHeaders[tableName]);
});
When('I see the {string} table content', (tableName) => {
  page
    .getTable(tableName)
    .getTableRows()
    .should(
      'deep.equal',
      convertDateAndTimeAndStatus(getTableDataSlice(0, 13))
    );
});

Then('I can verify the url with all the parameters', () => {
  page.searchResultPageVisibleWithAllParameters();
});

Then('I can use the pagination of the {string} table', (tableName) => {
  page.getTable(tableName).gotoNextTablePage();
  //cy.wait(1000);
  page
    .getTable(tableName)
    .getTableRows()
    .should('have.length', getTableDataSlice(0, 3).length);

  page
    .getTable(tableName)
    .gotoPreviousTablePage()
    .getTableRows()
    .should(
      'have.length',
      convertDateAndTimeAndStatus(getTableDataSlice(0, 10)).length
    );
});

Then('I can use the sorting of the {string} table', (tableName) => {
  page
    .getTable(tableName)
    .getTableHeaders()
    .each((header, i) => {
      if (i != 2) {
        return;
      }

      cy.wrap(header).click();
      cy.wrap(header).click();
    });

  let sorted = getTableDataSlice(tableName)
    .sort((x, y) => +new Date(x[2]) - +new Date(y[2]))
    .slice(0, 13);
  sorted.forEach((element) => {
    element[2] =
      convertDate(element[2], 'MMM dd, y') +
      ' at ' +
      convertDate(element[2], 'hh:mm');
    if (element[5] === ' Prelodged') {
      element[5] = ' Pre-lodged';
    }
  });

  page.getTable(tableName).getTableRows().should('deep.equal', sorted);
});
function getTableDataSlice(start: number = 0, end?: number) {
  return getTableData().slice(start, end);
}

function convertDateAndTimeAndStatus(data): string[][] {
  let i: number = 0;
  for (i; i < data.length; i++) {
    data[i][2] =
      convertDate(data[i][2], 'MMM dd, y') +
      ' at ' +
      convertDate(data[i][2], 'hh:mm');

    if (data[i][5] === ' Prelodged') {
      data[i][5] = ' Pre-lodged';
    }
  }
  return data;
}

function getTableData(i = 1) {
  return searchList.map((t) => [
    '',
    t.mrn,
    t.registrationDate,
    t.declarant.name,
    t.representative.name,
    ' ' + t.status,
    t.linkedPN,
    'more_vert'
  ]);
}
