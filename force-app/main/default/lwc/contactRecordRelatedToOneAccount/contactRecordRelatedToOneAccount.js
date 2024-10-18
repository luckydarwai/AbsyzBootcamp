import { LightningElement, track, api } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';
import createContact from '@salesforce/apex/AccountController.saveContactRecord';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class ContactRecordRelatedToOneAccount extends LightningElement {
    @track accountList = [];
    @track value = '---'; // Default value for combobox selection
    @track rec = {
        LastName: '',
        Title: '',
        Email: '',
        Phone: '',
        AccountId:''
    };

    connectedCallback() {
        this.callApexMethod();
    }

    callApexMethod() {
        getAccountList()
            .then(result => {
                this.accountList = result;
                console.log('AccountList ', this.accountList);
            })
            .catch(error => {
                console.error('Error calling Apex method: ', error);
            });
    }

    get options() {
        return this.accountList.map(acc => ({ label: acc.Name, value: acc.Id }));
    }

    handleChange(event) {
        this.value = event.detail.value;
    }

    handleContactRecord(event) {
        const fieldName = event.target.name;        
        this.rec[fieldName] = event.target.value; 
    }

    handleClick() {
        if (this.rec.LastName === '') {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error',
                    message: 'Last Name is required',
                    variant: 'error',
                })
            );
            return; 
        }

        createContact({ con: this.rec })
            .then(result => {
                this.rec = { LastName: '', Title: '', Email: '', Phone: '' }; // Reset form
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Contact created',
                        variant: 'success',
                    })
                );
            })
            .catch(error => {
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error creating record',
                        message: error.body.message,
                        variant: 'error',
                    })
                );
            });
    }
}
