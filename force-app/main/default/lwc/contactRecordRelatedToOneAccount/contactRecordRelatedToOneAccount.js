import { LightningElement } from 'lwc';
import getAccountList from '@salesforce/apex/AccountController.getAccountList';
export default class ContactRecordRelatedToOneAccount extends LightningElement {
    accountList = [];
    value='---';
    connectedCallback() {
        this.callApexMethod();
    }

    callApexMethod() {
        getAccountList()
            .then(result => {
                this.accountList = result;
                console.log('AccountList '+this.accountList);
            })
            .catch(error => {
                console.error('Error calling Apex method: ', error);
            });
    }


    get options() {        
        return [...this.accountList.map((acc)=>({label:acc.Name,value:acc.Name}))];
    }


    handleChange(event)
    {
      this.value = event.detail.value;
    }


    createContact(){
        
    }
}