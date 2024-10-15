import { LightningElement,api,wire } from 'lwc';
import { getRecord } from "lightning/uiRecordApi";
import getOpportunities from "@salesforce/apex/OpportunityLWCController.getOpportunities";
import getContactsLeads from "@salesforce/apex/OpportunityLWCController.getContactsLeads";

const FIELDS = ["Contact.Name", "Contact.Title", "Contact.Phone", "Contact.Email"];
export default class ContactRecordViewForm extends LightningElement {
    @api recordId;
    @api objectApiName;
    processedOpportunities;
    returnedContactsData;
    returnedLeadsData;
    oppNameNeedsToBePassed = 'Test OPP';
    
    
    
    @wire(getRecord,{recordId:"$recordId",fields:FIELDS})
    returndContact;       // promise
    
    
    
    get name() {
        return this.returndContact.data.fields.Name.value;
    }
    
    get title() {
        return this.returndContact.data.fields.Title.value;
    }
    
    get phone() {
        return this.returndContact.data.fields.Phone.value;
    }
    
    get email() {
        return this.returndContact.data.fields.Email.value;
    }
    
    
    
    // Wire Service with a Property
    @wire(getOpportunities)
    listOfOpportunities; // returns promise 
    
    // Wire Servive with a function
     @wire(getOpportunities)
     processOppRecords({data,error}){
        let modifiedOpps = [];
        try {
            if (data) {
                console.log("data of oppp ******* "+data[0].Name);     
                data.forEach(opp => {
                        let opportunity = {};
                    opportunity.Name = "Test - "+opp.Name
                    modifiedOpps.push(opportunity);
                });  
                this.processedOpportunities = modifiedOpps;
        
            }
            else if(error)
            {
                console.log(error);
        
            }
        } catch (error) {
            console.log(error);
            
        }


      
     };  
    
    
    async callContactAndLeads(){
        console.log('Button Tapped');
        
        let result  = await getContactsLeads({email:"test@test.com"});
        console.log('results contacts : '+result.contacts);
        console.log('results leads : '+result.leads);
        
        this.returnedContactsData = result.contacts;
        this.returnedLeadsData = result.leads;
    }
    
}