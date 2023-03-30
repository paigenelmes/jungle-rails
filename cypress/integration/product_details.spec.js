/// <reference types="cypress" />

describe('homepage tests', () => {
  // Visit the homepage & navigate to Scented Blade product detail before each test
  beforeEach(() => {
    cy.visit('/')
    cy.contains("Scented Blade")
      .click();
  });

  it("displays the product description", () => {
    cy.get("p")
      .should("contain", "The Scented Blade is an extremely rare, tall plant and can be found mostly in savannas.");
  });

});