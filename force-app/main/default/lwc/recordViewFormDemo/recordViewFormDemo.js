import { LightningElement,api } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import RATING_FIELD from '@salesforce/schema/Account.Rating';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';


export default class RecordViewFormDemo extends LightningElement {
   @api recordId;
   @api objectApiName;
    fieldObject = {
        Name : NAME_FIELD,
        Industry : INDUSTRY_FIELD,
        Rating : RATING_FIELD,
        Revenue:REVENUE_FIELD
    }
}