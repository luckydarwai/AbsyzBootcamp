import { getFieldDisplayValue, getRecord } from 'lightning/uiRecordApi';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_INDUSTRY from '@salesforce/schema/Account.Industry';
import ACCOUNT_RATING from '@salesforce/schema/Account.Rating';
import { LightningElement,wire,api } from 'lwc';

export default class Assignment29T7 extends LightningElement {
   @api recordId;
   accName;
   accIndustry;
   accRating

    @wire(getRecord,{
        recordId:'$recordId',
        fields:[ACCOUNT_NAME,ACCOUNT_INDUSTRY,ACCOUNT_RATING]
    })
    outputFunction({data,error})
    {
          if (data) {
            console.log('Account Details - ',data);
            
            this.accName = data.fields.Name.value;
            this.accIndustry = getFieldDisplayValue(data,ACCOUNT_INDUSTRY);
            this.accRating = getFieldDisplayValue(data,ACCOUNT_RATING);
          }
          else if(error){
            console.log("Error ",error);
            
        }
    }
}