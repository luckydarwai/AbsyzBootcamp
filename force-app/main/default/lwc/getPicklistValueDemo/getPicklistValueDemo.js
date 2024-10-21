import { getObjectInfo, getPicklistValues, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement,wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_INDUSTRY from '@salesforce/schema/Account.Industry';

export default class GetPicklistValueDemo extends LightningElement {
    
    value;
    @wire(getObjectInfo,{
        objectApiName:ACCOUNT_OBJECT
    })
    accountinfo;


    @wire(getPicklistValues,{
        recordTypeId:'$accountinfo.data.defaultRecordTypeId',
        fieldApiName:ACCOUNT_INDUSTRY
    })industryPickList;
   
// In order to get the all the present picklist fields in the object used this
    @wire(getPicklistValuesByRecordType,{
        recordTypeId:'$accountinfo.data.defaultRecordTypeId',
        objectApiName : ACCOUNT_OBJECT
    })
    accountInfoPicklist;
    // accountInfoPicklist({data,error}){
    //     if (data) {
    //         console.log("data :",data);
            
    //     }else if(error)
    //     {
    //         console.log("error :",error);
            
    //     }
    // }


    

handleChange(event)
{
    this.value = event.target.value;
}


    }