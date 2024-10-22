import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import  ACCOUNT_OBJECT from '@salesforce/schema/Account';



// For multiple objects use (getObjectInfos) and pass the arrary to the objectApiName of objects which has imported.
export default class GetObjectInfoDemo extends LightningElement {
   accountinfo;
   accounterror;


    @wire(getObjectInfo,{
        objectApiName : ACCOUNT_OBJECT
    })
    outputFunction({data,error}){
        if (data) {
             console.log("Account Info Data ",data);
             this.accountinfo=data;
             this.accounterror=null;
                         
        }else if(error){
            console.log("Account Info Error ",error);
            this.error = error;
            this.accountinfo = null;
            
        }
    }
}