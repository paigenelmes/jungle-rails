/// <reference types="cypress" />

describe('homepage tests', () => {
  // Visit the homepage before each test
  beforeEach(() => {
    cy.visit('/')
  });

  it("displays the homepage title", () => {
    cy.get("h1")
      .should("contain", "The Jungle");
  });

  it("displays a list of products on the homepage", () => {
    cy.get(".products article")
      .should("be.visible");
  });

  it("displays 2 products on the homepage", () => {
    cy.get(".products article")
      .should("have.length", 2);
  });

});