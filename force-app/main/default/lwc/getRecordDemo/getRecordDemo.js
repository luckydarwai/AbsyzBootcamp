import { LightningElement,api,wire } from 'lwc';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_REVENUE from '@salesforce/schema/Account.AnnualRevenue';
import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';
export default class GetRecordDemo extends LightningElement {
    @api recordId;
    accname;
    accRevenue;
    
    @wire(getRecord,{
        recordId:"$recordId",
        fields:[ACCOUNT_NAME,ACCOUNT_REVENUE]
    })outputFunction({data,error}){
        if (data) {
            console.log("Data ",data);
            // this.accname = data.fields.Name.value;
            // this.accRevenue = data.fields.AnnualRevenue.value;
            // this.accname =   getFieldValue(data,ACCOUNT_NAME); // used for calculation purpose
            // this.accRevenue = getFieldValue(data,ACCOUNT_REVENUE);
                      
            this.accname = getFieldDisplayValue(data,ACCOUNT_NAME);
            this.accRevenue = getFieldDisplayValue(data,ACCOUNT_REVENUE);
        }else if(error){
            console.log("Error ",error);
            
        }
    }
}