/// <reference types="cypress"/>

describe('tarefas', () => {
    cy.visit('http://localhost:3000/')
    cy.get('#newTask')
})