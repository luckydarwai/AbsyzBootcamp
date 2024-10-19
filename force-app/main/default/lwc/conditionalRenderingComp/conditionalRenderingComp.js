import { LightningElement } from 'lwc';

export default class ConditionalRenderingComp extends LightningElement {

    displayMessage = false;
    superStars = ['Spiderman','Superman','batman','goodman'];

    contactList = [
        {
            id:1,
            firstname : "marc",
            lastname : "Benioff"
        },
        {
            id:2,
            firstname : "Tim",
            lastname : "Benioff"
        },
        {
            id:3,
            firstname : "Smith",
            lastname : "York"
        },
        {
            id:4,
            firstname : "Jack",
            lastname : "pork"
        },
    ]

    changeHandler(event)
    {
        // toggle handling is 35
        this.displayMessage = !this.displayMessage;
    }
}