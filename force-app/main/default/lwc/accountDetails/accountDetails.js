import { LightningElement,wire } from 'lwc';
import getParentAccounts from "@salesforce/apex/AccountController.getParentAccounts";
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT  from '@salesforce/schema/Account';
import ACCOUNT_SLA_TYPE from '@salesforce/schema/Account.SLA__c';
import ACCOUNT_PARENT from '@salesforce/schema/Account.ParentId';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_SLA_EXPIRY_DT from '@salesforce/schema/Account.SLAExpirationDate__c';
import ACCOUNT_NO_OF_LOCATION from '@salesforce/schema/Account.NumberofLocations__C';
import ACCOUNT_DESCRIPTION from '@salesforce/schema/Account.Description';

import { createRecord } from 'lightning/uiRecordApi';

export default class AccountDetails extends LightningElement {
    parentOptions=[];
    selParentAcc = "";
    selAcc="";
    slaExpDate = null;
    slaType="";
    slaPicklistval=[];
    selnoOfLocations = "1";
    description="";
    
    @wire(getParentAccounts)wired_getParentAccount({data,error}){
        if (data) {
            console.log('data : ',data);
            this.parentOptions =  data.map((curritem)=>({
                label:curritem.Name,
                value: curritem.Id
            }))
            
        }else if(error)
            {
            console.log("error : ",error);
            
        }
    }
    @wire(getObjectInfo,{
        objectApiName : ACCOUNT_OBJECT
    })
    accountobjectinfo;
    
    @wire(getPicklistValues,
        {
            recordTypeId : "$accountobjectinfo.data.defaultRecordTypeId",
            fieldApiName :  ACCOUNT_SLA_TYPE
        }
    )
    slapicklist({data,error})
    {
        // this.slaPicklistval = [];
        if (data) {
            this.slaPicklistval = data;
            console.log('Picklist Data : ',data);
            
        }
        else if(error)
            {
            console.log("Error : ",error);
            
        }
    }
    
    handleChange(event)
    {
        let {name, value} = event.target;
        
        if(name === 'parentacc')
            {
            this.selParentAcc = value;
        }
        else if(name ==='accname')
            {
            this.selAcc = value;
        }
        else if(name ==='slaexpdt')
            {
            this.slaExpDate = value;
        }
        else if(name ==='slatype')
            {
            this.slaType = value;
        }
        else if(name ==='nooflocations')
            {
            this.selnoOfLocations=value;
        }
        else if(name ==='description')
            {
            this.description = value;
        }
    }
    
    saveRecord(){
        if (this.validateInput()) {
          let  inputfields = {}
             inputfields[ACCOUNT_NAME.fieldApiName] = this.selAcc;
             inputfields[ACCOUNT_PARENT.fieldApiName] = this.selParentAcc;
             inputfields[ACCOUNT_SLA_TYPE.fieldApiName] = this.slaType;
             inputfields[ACCOUNT_SLA_EXPIRY_DT.fieldApiName] = this.slaExpDate;
             inputfields[ACCOUNT_NO_OF_LOCATION.fieldApiName] = this.selnoOfLocations;
             inputfields[ACCOUNT_DESCRIPTION.fieldApiName] = this.description;

            let recordInput = {
                apiName:ACCOUNT_OBJECT.objectApiName,
                fields:inputfields
            }
            createRecord(recordInput).then((result)=>{
                console.log('Account Created Succesfully : ',result);
                
            }).catch((error)=>{
                console.log('Error in Creation : ',error);
                
            })
        } 
        else{
            console.log("Inputs are not valid");
            
        }
    }
    validateInput(){
        let fields = Array.from(this.template.querySelectorAll(".validetme"));
        
        let isValid =  fields.every((curritem) => curritem.checkValidity());
        return isValid;
    }
    
}