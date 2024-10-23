import { LightningElement, wire } from 'lwc';
import getContactListByFilter from '@salesforce/apex/contactBrowserController.getContactListByFilter';


export default class ContactBrowser extends LightningElement {
    selectedAccountId="";
    selectedIndustry="";
 

    @wire(getContactListByFilter,{
        accountId : '$selectedAccountId',
        industry : '$selectedIndustry'
    })
    contacts;
    // contactsFunction({data,error})
    // {
    //     if (data) {
    //         console.log('Selected Contacts : ',data);
            
    //     }
    //     else if(error)
    //     {
    //         console.log('Selected Contacts failed : ',error);
            
    //     }
    // }
    

    handleFilterChange(event){
         this.selectedAccountId = event.detail.accountId;
         this.selectedIndustry = event.detail.industry;  
    }
}