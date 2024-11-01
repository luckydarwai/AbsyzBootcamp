import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { FlowNavigationNextEvent } from 'lightning/flowSupport';

export default class Assignment29Task18 extends LightningElement {
    

    @api recordId; // Account Record Id from Flow
   
  

    handleSave() {     

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Account updated successfully!',
                variant: 'success'
            })
        );

        // Navigate to next screen (Contact Creation)
        this.dispatchEvent(new FlowNavigationNextEvent());
    }
}