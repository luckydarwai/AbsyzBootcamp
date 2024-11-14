import { LightningElement,wire,track } from 'lwc';
import getSearchData from '@salesforce/apex/SoslController.getSearchData';
const columnsAcc = [
    { label: 'Name', fieldName: 'Name' }   
];
const columnsCon = [
    { label: 'Name', fieldName: 'Name' }   
];
const columnsOpp = [
    { label: 'Name', fieldName: 'Name' }   
];
const columnsLead = [
    { label: 'Name', fieldName: 'Name' }   
];
const columnsCase = [
    { label: 'Name', fieldName: 'Status' }   
];


export default class SoslScenario1 extends LightningElement {
    // columnsAcc=columnsAcc;
    // columnsCon=columnsCon;
    // columnsOpp=columnsOpp;
    // columnsLead=columnsLead;
    // columnsCase=columnsCase;

columns;
@track searchString = '';
@track data;
@track error;
@track accounts;
@track contacts;
@track opportunities;
@track leads;
@track cases;
@track records;
  @wire(getSearchData,{searchText:'$searchString'})
  wiredRecords({data,error})
    {
        if (data) {
            this.accounts = data[0];
            this.contacts = data[1];
            this.opportunities = data[2];
            this.leads = data[3];
            this.cases = data[4];
            this.data = data;
            this.error = undefined;
            console.log('Data : ',data);
            
        }
        else if(error)
        {
            this.data = undefined;
            this.error = error;
            console.log('Error : ',error);
            
        }
    }


    inputHandler(event)
    {
        if (event.target.name=='search') {
            this.searchString = event.target.value;
        }
    }


    handleClick(event)
    {
         console.log('Tapped');
         
        let label = event.target.name;
         console.log( label+' Tapped');
         
         if (label=='Account') {
            this.records = this.accounts;
            this.columns=columnsAcc;
         }
        else if(label=='Contact')
        {
            this.records = this.contacts;
            this.columns = columnsCon;
        }
        else if(label=='Opportunity')
        {
            this.records = this.opportunities;
            this.columns = columnsOpp;
        }
        else if(label=='Lead')
        {
            this.records = this.leads;
            this.columns = columnsLead;
        }
        else if(label=='Case')
        {
            this.records = this.cases;
            this.columns = columnsCase;
        }
    }
}