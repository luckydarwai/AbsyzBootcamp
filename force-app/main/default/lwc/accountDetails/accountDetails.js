import { LightningElement,wire,api } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getParentAccounts from "@salesforce/apex/AccountController.getParentAccounts";
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT  from '@salesforce/schema/Account';
import ACCOUNT_ID from '@salesforce/schema/Account.Id';
import ACCOUNT_SLA_TYPE from '@salesforce/schema/Account.SLA__c';
import ACCOUNT_PARENT from '@salesforce/schema/Account.ParentId';
import ACCOUNT_NAME from '@salesforce/schema/Account.Name';
import ACCOUNT_SLA_EXPIRY_DT from '@salesforce/schema/Account.SLAExpirationDate__c';
import ACCOUNT_NO_OF_LOCATION from '@salesforce/schema/Account.NumberofLocations__c';
import ACCOUNT_DESCRIPTION from '@salesforce/schema/Account.Description';
import { NavigationMixin } from 'lightning/navigation';
import { createRecord, deleteRecord, getFieldValue, getRecord, updateRecord } from 'lightning/uiRecordApi';


const fieldsToLoad = [ACCOUNT_PARENT,ACCOUNT_NAME,ACCOUNT_SLA_EXPIRY_DT,ACCOUNT_SLA_TYPE,ACCOUNT_DESCRIPTION];
export default class AccountDetails extends NavigationMixin(LightningElement) {
    parentOptions=[];
    selParentAcc = "";
    selAcc="";
    slaExpDate = null;
    slaType="";
    slaPicklistval=[];
    selnoOfLocations = "1";
    description="";
    @api recordId;
    
    @wire(getRecord,{
        recordId:'$recordId',
        fields:fieldsToLoad
    })wiredgetRecord_Function({data,error})
    {
        if (data) {
            console.log("Getting Existing Data : ",data);
            
            this.selParentAcc = getFieldValue(data,ACCOUNT_PARENT);
            this.selAcc = getFieldValue(data,ACCOUNT_NAME);
            this.selnoOfLocations = getFieldValue(data,ACCOUNT_NO_OF_LOCATION);
            this.slaExpDate = getFieldValue(data,ACCOUNT_SLA_EXPIRY_DT);
            this.slaType = getFieldValue(data,ACCOUNT_SLA_TYPE);
            this.description = getFieldValue(data,ACCOUNT_DESCRIPTION);
        }
        else if(error)
            {
            console.log('Error Message During Retrieval : ',error)
        }
    }
    
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
            
            
            if (this.recordId) {
                inputfields[ACCOUNT_ID.fieldApiName] = this.recordId;
                let recordInput = {
                    fields : inputfields
                }
                updateRecord(recordInput).then((result)=>{
                    console.log("Record Updated Succesfully : ",result);
                    this.showToast();
                    
                }).catch((error)=>{
                    console.log("Record Updation Failed : ",error);
                    
                })
            }
            else{
                
                let recordInput = {
                    apiName:ACCOUNT_OBJECT.objectApiName,
                    fields:inputfields
                }
                createRecord(recordInput).then((result)=>{
                    console.log('Account Created Succesfully : ',result);
                    let ref =  {
                        type: 'standard__recordPage',
                        attributes: {
                            recordId: result.id,
                            objectApiName: ACCOUNT_OBJECT.objectApiName,
                            actionName: 'view'
                        }
                    }
                    this[NavigationMixin.Navigate](ref);
                    
                }).catch((error)=>{
                    console.log('Error in Creation : ',error);
                    
                })
                
                
            }
        }
        else{
            console.log("Inputs are Not Valid");
            
        }
    }
    
    validateInput(){
        let fields = Array.from(this.template.querySelectorAll(".validetme"));
        
        let isValid =  fields.every((curritem) => curritem.checkValidity());
        return isValid;
    }
    
    async deleteHandler(){
        try {
            await deleteRecord(this.recordId).then(()=>{
                let ref = {
                    type: 'standard__objectPage',
                    attributes: {
                        objectApiName: ACCOUNT_OBJECT.objectApiName,
                        actionName: 'list'
                    },
                    state: {
                        filterName: 'MyAccounts'
                  }
                };
            this[NavigationMixin.Navigate](ref);
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Success',
                    message: 'Record deleted',
                    variant: 'success'
                })
            )});


          
        } catch (error) {
            this.dispatchEvent(
                new ShowToastEvent({
                    title: 'Error deleting record',
                    message: 'Something Went Wrong',
                    variant: 'error'
                })
            );
        }
    }
    
    get formTitle(){
        return this.recordId ? 'Edit Account' : 'Create Account';
    }


    showToast(){
        const event =new ShowToastEvent(
          {  title:"Sucess",
             message : "Record Updated Successfully",
             variant : "success"
          }
        );
        this.dispatchEvent(event);
    }
}