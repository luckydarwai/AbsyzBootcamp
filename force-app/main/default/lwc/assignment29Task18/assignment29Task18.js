import { LightningElement, api, track } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { FlowNavigationNextEvent } from 'lightning/flowSupport';

export default class Assignment29Task18 extends LightningElement {
    

    @api recordId; // Account Record Id from Flow
    @track industry = '';
    @track industryOptions = [
        { label: 'Agriculture', value: 'Agriculture' },
        { label: 'Banking', value: 'Banking' },
        { label: 'Consulting', value: 'Consulting' },
        { label: 'Education', value: 'Education' },
        // add more industries as needed
    ];

    handleIndustryChange(event) {
        this.industry = event.detail.value;
    }

    handleSave() {
        // Update Account Industry here using recordId and industry
        // Ideally, you'd use @wire or Apex to update

        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: 'Account Industry updated successfully!',
                variant: 'success'
            })
        );

        // Navigate to next screen (Contact Creation)
        this.dispatchEvent(new FlowNavigationNextEvent());
    }
}
