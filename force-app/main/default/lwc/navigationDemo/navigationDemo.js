import { LightningElement } from 'lwc';
import {NavigationMixin} from "lightning/navigation";
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import Industry from '@salesforce/schema/Account.Industry';

export default class NavigationDemo extends NavigationMixin(LightningElement) {
    value;
    navHomeClickHandler(){
        let pageRef  = {
            type: 'standard__namedPage',
            attributes: {
                pageName: 'home'
            }
        };
        this[NavigationMixin.Navigate](pageRef);
    }
    
    
    accListViewClickHandler(){
        let pageRef = 
        // Navigates to account list with the filter set to Recent.
        {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'list'
            },
            state: {
                filterName: 'Recent'
            }
        };
        this[NavigationMixin.Navigate](pageRef);
    }
    
    createNewAccClickHandler(){
        let pageRef = 
        {
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Account',
                actionName: 'new'
            },
            
        }
        this[NavigationMixin.Navigate](pageRef);
    }

    createNewAccDefaultValueClickHandler(){
    const defaultValues = encodeDefaultFieldValues({
        Industry:"Energy",
        Rating:"Hot"
    });
    let pageRef = 
    {
        type: 'standard__objectPage',
        attributes: {
            objectApiName: 'Account',
            actionName: 'new'
        },
        state:{
            defaultFieldValues:defaultValues
        }
        
    }
    this[NavigationMixin.Navigate](pageRef);
    }



    editAccountHandler(){
        let pageRef = 
        {
            type: 'standard__objectPage',
            attributes: {
                recordId:'001dM000023mIXlQAM',
                objectApiName: 'Account',
                actionName: 'edit'
            },
           
            
        }
        this[NavigationMixin.Navigate](pageRef);
    }
}