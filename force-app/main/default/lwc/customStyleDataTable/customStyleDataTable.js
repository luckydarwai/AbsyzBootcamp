import { LightningElement,wire } from 'lwc';
import getContactListForDataTAble from '@salesforce/apex/contactController.getContactListForDataTAble';


const columns = [
    { label: 'Name', type:"customNameType",typeAttributes:{
        contactName : {
            fieldName : "Name"
        }
    } },
    { label: 'Account Name', fieldName: 'accountLink', type:'url' ,typeAttributes:{ // to modify the type id to account name for display
        label:{
            fieldName:"accountName"
        },
        target:"_blank"
    }},
    { label: 'Title', fieldName: 'Title', cellAttributes:{
        class:{
            fieldName : "titleColor"
        }
    } },
    { label: 'Rank', fieldName: 'Rank__c', type: 'customRank',
        typeAttributes:{
            rankIcon : {
                fieldName : "rankIcon"
            }
        }
     },
     { label: 'Phone', fieldName: 'Phone', type: 'phone' },
    { label: 'Email', fieldName: 'Email', type: 'email' },
    { label: 'Picture',  type: 'customPicture', fieldName : "Picture__c"
        // typeAttributes:{
        //     pictureUrl : {
        //         fieldName : "Picture__c"
        //     }
        // },
        // cellAttributes:{
        //     alignment:"center"
        // }
     },
    
];

export default class CustomStyleDataTable extends LightningElement {


    contacts;
    columns = columns;

    @wire(getContactListForDataTAble)
    wiredContacts({data,error}){
        if (data) {
            console.log(data);
            // this.contacts = data;
         this.contacts =   data.map((record)=>{
                let accountLink = "/" + record.AccountId;
                let accountName = record.Account.Name;
                let titleColor="slds-text-color_success";
                let rankIcon = record.Rank__c > 5 ? "utility:ribbon":"";
                return{
                    ...record,
                    accountLink: accountLink,
                    accountName :  accountName,
                    titleColor : titleColor,
                    rankIcon : rankIcon
                };
            });
            
        }
        else if(error)
        {
            console.log(error);
            
        }
    }
}