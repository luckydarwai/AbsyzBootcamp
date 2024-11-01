import { LightningElement, api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { FlowNavigationNextEvent } from 'lightning/flowSupport';

export default class Assignment29Task18Contact extends LightningElement {
  @api recordId;

  contactpHandleSave() {     

    this.dispatchEvent(
        new ShowToastEvent({
            title: 'Success',
            message: 'Contact Created successfully!',
            variant: 'success'
        })
    );

    // Navigate to next screen (Contact Creation)
    this.dispatchEvent(new FlowNavigationNextEvent());
}
}