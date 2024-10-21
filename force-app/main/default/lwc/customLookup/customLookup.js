import { LightningElement,wire,api } from 'lwc';
import searchRecords from '@salesforce/apex/customLookupController.searchRecords'
const DELAY = 200;
export default class CustomLookup extends LightningElement {
    
   @api apiName='Account';
    searchvalue;
    @api objectLabel = 'Account';
    @api iconName = 'standard:account';
    delayTimeout;
    selectedRecord ={
      selectedId : '',
      seletedName: ''
    };
    displayOptions = false;
    @wire(searchRecords,{
        objectApiName : '$apiName',  //$apiName is Reactive property
        searchKey : '$searchvalue'
    })
    outputs;
    // outputsFunction({data,error}){
    //     if (data) {
    //         console.log('Data ',data);
    //     }
    //     else if(error)
    //         {
    //         console.log('Error ',error);
    //     }
    // };

    // get showOutput(){
    //  return this.outputs.data;
    // }



    get isRecordSelected(){
        return this.selectedRecord.selectedId === '' ? false : true;
    }

    changeHandler(event)
    {
       window.clearTimeout(this.delayTimeout);
       let enteredValue = event.target.value;

       //debouncing - do not update the reactive property as long as this function is being called within a delay
     this.delayTimeout = setTimeout(()=>{
            this.searchvalue = enteredValue;
            this.displayOptions = true;
        },DELAY)
    }

    clickHandler(event){
          let selectedId= event.currentTarget.dataset.item;
          console.log("Selected Id ",selectedId);
          let outputRecord = this.outputs.data.find(
            (currItem)=> currItem.Id === selectedId
            );

          this.selectedRecord =  {
            selectedId : outputRecord.Id,
            seletedName : outputRecord.Name
          } 
          this.displayOptions = false;
          
    }


    removalSelectionHandler(event)
    {
     this.selectedRecord ={
        selectedId : '',
        seletedName: ''
      };   

      this.displayOptions = false;
    }
}