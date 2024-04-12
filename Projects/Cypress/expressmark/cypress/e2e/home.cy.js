///  <reference types="cypress"/> 

describe('home',() => {
    it('web app deve estar on line',()=>{
        cy.visit('http://localhost:3000/')

        cy.title().should('eq','Gerencie suas tarefas com Mark L')
    } )
})