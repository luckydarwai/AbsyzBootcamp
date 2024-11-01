import { LightningElement,api,wire } from 'lwc';
import getContactsByAccountId from '@salesforce/apex/contactController.getContactsByAccountId';

export default class AssignmentTaskComp extends LightningElement {

    name = "Lucky Darwai";
    showTextVar = false;

    showText(event){
        this.showTextVar = !this.showTextVar;    
        // event.target.checked


    //     if (this.showTextVar) {
    //         this.showTextVar = false;
    //     }
    //    else{
    //     this.showTextVar = true;
    //    }
       
    }





    @api recordId;  // This will hold the Account Id

    columns = [
        { label: 'Contact Name', fieldName: 'Name', type: 'text' },
        { label: 'Title', fieldName: 'Title', type: 'text' },
        { label: 'Phone', fieldName: 'Phone', type: 'phone' },
        { label: 'Email', fieldName: 'Email', type: 'email' },
        { label: 'Contact Owner', fieldName: 'OwnerName', type: 'text' }
    ];
    contactList = [];

    @wire(getContactsByAccountId, { accountId: '$recordId' })
    contactFun({data, error}){
        console.log("data of contacts : ", data);
        if(data) {
            this.contactList = data.map((contact) => (
                { ...contact, OwnerName: contact.Owner.Name }));
        console.log("data of contactList : ", this.contactList);
        }
    };

    
}