import { LightningElement,wire } from 'lwc';
import { createRecord } from "lightning/uiRecordApi";
import CONTACT_OBJECT from "@salesforce/schema/Contact";
import NAME_FIELD from "@salesforce/schema/Contact.LastName";
import LEAD_SOURCE_FIELD from "@salesforce/schema/Contact.LeadSource";
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Assignment29T15 extends LightningElement {

    name;
    leadSource;  
    leadSourcePickList;

    
    @wire(getObjectInfo,{
        objectApiName:CONTACT_OBJECT
    })
    contactinfo;


    @wire(getPicklistValuesByRecordType,{
        recordTypeId:'$contactinfo.data.defaultRecordTypeId',
        objectApiName : CONTACT_OBJECT
    })
    // accountInfoPicklist;
      contactInfoPicklistFun({data,error}){
        if (data) {
            console.log("data :",data);
            this.leadSourcePickList = data.picklistFieldValues.LeadSource.values;
            
        }else if(error)
        {
            console.log("error :",error);
            
        }
    }


    handleInput(event) {
        if (event.target.name === 'name') {
            
            this.name = event.target.value;
        }
        else if(event.target.name === 'leadsource')
        {
            this.leadSource = event.target.value;
        }
    }
  
    async handleCreate() {
      const fields = {};
      // Map the user input to the fields
      fields[NAME_FIELD.fieldApiName] = this.name;
      fields[LEAD_SOURCE_FIELD.fieldApiName] = this.leadSource;
  
      // Configure your recordInput object with the object and field API names
      const recordInput = { apiName: CONTACT_OBJECT.objectApiName, fields };
      console.log('record INput : ',recordInput);
    
  
      try {
        // Invoke createRecord
        const contact = await createRecord(recordInput);
        console.log('Contact Status ',contact);
        this.showToast();
        
        
      } catch (error) {
        // Handle error
        this.showErrorToast();
      }
    }



    showToast() {
        const event = new ShowToastEvent({
            title: 'New Contact Created',
            message:
                'New Contact Create Successfully',
            variant:"success"
        });
        this.dispatchEvent(event);
    }

    showErrorToast() {
        const event = new ShowToastEvent({
            title: 'Wrong',
            message:
                'Something Went Wrong',
            variant:"error"
        });
        this.dispatchEvent(event);
    }
}