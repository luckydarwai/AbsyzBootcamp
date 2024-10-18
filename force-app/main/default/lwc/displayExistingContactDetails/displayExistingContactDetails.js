import { LightningElement, wire,track } from 'lwc';
import getContactsRecord from '@salesforce/apex/contactController.getContactsRecord';
import Phone from '@salesforce/schema/Account.Phone';
const columns = [
    { label: 'Name', fieldName: 'name' },
    { label: 'Title', fieldName: 'title',},
    { label: 'Phone', fieldName: 'phone', type: 'phone' },
    { label: 'Email', fieldName: 'email', type: 'email' },
];
export default class DisplayExistingContactDetails extends LightningElement {

   @track details=[];
    columns = columns;


    @wire(getContactsRecord)
    processContactRecord({data,error}){

        if (data) {
              this.details = data.map((con)=>({
                 name : con.Name,
                 title:con.Title,
                 phone:con.Phone,
                 email:con.Email
              }));    
              
         console.log('Details'+this.details);
              
        } else {
            console.log(error);
        }
    }


}