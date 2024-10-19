import { LightningElement } from 'lwc';

export default class DynamicCSSComp extends LightningElement {
    pColor ='chocolate-color';




    addCSSHandler(event)
    {
        let element = this.template.querySelector("p");
        element.classList.add('green-border');
    }


    removeCSSHandler(event)
    {
        let element = this.template.querySelector("p");
         element.classList.remove('green-border');
    }


    toggleCSSHandler(event)
    {
        let element = this.template.querySelector("p");
        element.classList.toggle('green-border');
    }
}