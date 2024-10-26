import { LightningElement,wire } from 'lwc';
import { createRecord } from "lightning/uiRecordApi";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";
import NAME_FIELD from "@salesforce/schema/Account.Name";
import RATING_FIELD from "@salesforce/schema/Account.Rating";
import { getObjectInfo, getPicklistValues, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Assignment29T8 extends LightningElement {

    name;
    rating;  
    ratingPickList;

    
    @wire(getObjectInfo,{
        objectApiName:ACCOUNT_OBJECT
    })
    accountinfo;


    @wire(getPicklistValuesByRecordType,{
        recordTypeId:'$accountinfo.data.defaultRecordTypeId',
        objectApiName : ACCOUNT_OBJECT
    })
    // accountInfoPicklist;
      accountInfoPicklistFun({data,error}){
        if (data) {
            console.log("data :",data);
            this.ratingPickList = data.picklistFieldValues.Rating.values
            
        }else if(error)
        {
            console.log("error :",error);
            
        }
    }


    handleInput(event) {
        if (event.target.name === 'name') {
            
            this.name = event.target.value;
        }
        else if(event.target.name === 'rating')
        {
            this.rating = event.target.value;
        }
    }
  
    async handleCreate() {
      const fields = {};
      // Map the user input to the fields
      fields[NAME_FIELD.fieldApiName] = this.name;
      fields[RATING_FIELD.fieldApiName] = this.rating;
  
      // Configure your recordInput object with the object and field API names
      const recordInput = { apiName: ACCOUNT_OBJECT.objectApiName, fields };
      console.log('record INput : ',recordInput);
      this.showToast();
  
      try {
        // Invoke createRecord
        const account = await createRecord(recordInput);
        console.log('Account Status ',account);
        
        
      } catch (error) {
        // Handle error
      }
    }



    showToast() {
        const event = new ShowToastEvent({
            title: 'New Account Created',
            message:
                'New Account Create Successfully',
            variant:"success"
        });
        this.dispatchEvent(event);
    }
}