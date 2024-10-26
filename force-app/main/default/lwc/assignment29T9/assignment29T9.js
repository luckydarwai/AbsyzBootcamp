import { LightningElement,wire } from 'lwc';
import getContactListByName from '@salesforce/apex/contactController.getContactListByName';


const columns = [
    { label: 'Name', fieldName: 'Name' },   
    { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email'},
   
];

export default class Assignment29T9 extends LightningElement {
    //  search existing Contact Record and display records in tabular format using wire method (Call Apex Method)

   keyName='';
   columns = columns;  // sending data to html from here ---
   data=[];
    @wire(getContactListByName,{name:'$keyName'})
    
    contactList({data,error}){
       if (data) {
         console.log('Contact List : ',data);
         this.data = data;
         
       }
       else if(error)
       {
        console.log('Error : ',error);
        
       }
    }


    searchHandler(event){
        this.keyName = event.target.value;
    }
}