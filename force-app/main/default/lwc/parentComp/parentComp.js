import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {

    displayURL = '';


    getChildURL(event)
    {
          this.displayURL = event.detail.message;
    }

}