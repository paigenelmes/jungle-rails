/// <reference types="cypress" />

describe('homepage tests', () => {
  // Visit the homepage and click Add button before each test
  beforeEach(() => {
    cy.visit('/')
    cy.get('button[type=submit]').contains("Add")
      .click( { force: true });
  });

  it("increases the count of My Cart by 1", () => {
    cy.get('.nav-link').contains("My Cart")
      .should("contain", "1");
  });

});