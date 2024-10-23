import { LightningElement,wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import ACCOUNT_INDUSTRY from '@salesforce/schema/Account.Industry';
import { NavigationMixin } from 'lightning/navigation';
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';


export default class ContactFilter extends NavigationMixin(LightningElement) {
    selectedAccountId="";
    industryPicklist="";
    selectedIndustry;
    isButtonDisabled = true;
    
    
    @wire(getObjectInfo,{
        objectApiName: ACCOUNT_OBJECT
    })
    accountInfo;
    
    @wire(getPicklistValues,{
        recordTypeId:"$accountInfo.data.defaultRecordTypeId",
        fieldApiName: ACCOUNT_INDUSTRY
    })
    //    industryPicklist;
    industryPicklistMethod({data,error}){
        if (data) {
            this.industryPicklist = data.values;
            console.log("PickList Data ",data.values);
            
        }else if (error) {
            console.log("Error Data ",error);
            
        }
    }
    
    
    
    selectorRecordHandler(event)
    {
        this.selectedAccountId =  event.detail;
        console.log("this.selectedId : ",this.selectedAccountId);
        if (this.selectedAccountId) {
            this.isButtonDisabled = false;
        }
        else{
            this.isButtonDisabled = true;
        }

        this.notifyFilterChange();
    }
    
    
    handlerChange(event)
    {
          this.selectedIndustry = event.target.value;
          this.notifyFilterChange();
    }

  

    
    addNewContact(){
        // create page Reference
        
        
      let defaultValue = encodeDefaultFieldValues ({
        AccountId:this.selectedAccountId
      })
        let pageRef ={
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Contact',
                actionName: 'new'
            },
            state: {
                defaultFieldValues : defaultValue,
               
            }
        };

        this[NavigationMixin.Navigate](pageRef);
        
    }

notifyFilterChange(){
    let myCustomEvent = new CustomEvent('filterchange',{
        detail : {
            accountId : this.selectedAccountId,
            industry : this.selectedIndustry
        }
    });
    this.dispatchEvent(myCustomEvent);
}

}