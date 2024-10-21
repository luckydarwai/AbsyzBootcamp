import { LightningElement,wire,track } from 'lwc';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
import CONTACT_NAME_FIELD from '@salesforce/schema/Contact.Name';
import {getRecords} from 'lightning/uiRecordApi';
export default class GetRecordsDemo extends LightningElement {

 @track outputs=[];
  error;

    @wire(getRecords,{
        records : [
            {
                recordIds:['001dM000023mIXlQAM'],
                fields:[ACCOUNT_NAME_FIELD]
            },
            {
                recordIds:['003dM000006ozWHQAY'],
                fields:[CONTACT_NAME_FIELD]
            },
        ]
    }) outputFunction({data,error})
    {
        if (data) {
            console.log("Data ",data);
            this.outputs = data;
            this.error = null;
            
        }
        // else if(error){
        //     console.log("Error ",error);
        //     this.error = error;
        //     this.outputs = null;
            
        // }
    }
}