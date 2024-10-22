import { LightningElement, wire } from 'lwc';
import getContactList from '@salesforce/apex/contactController.getContactList';
export default class ContactList extends LightningElement {
    @wire(getContactList)
    contacts;
    // contactsMethod({data,error})
    // {
    //     if (data) {
    //         console.log("Data ",data);
            
            
    //     }
    //     else if(error)
    //     {
    //         console.log("Error ",error);
    //     }
    // };

}