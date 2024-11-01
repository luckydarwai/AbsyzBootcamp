import { LightningElement,api } from 'lwc';

export default class Assignment29T10Child extends LightningElement {
  @api parentSomeText;
  someText;

  childTextHandler(event)
  {
     
       this.someText = event.target.value;
       const custEvent = new CustomEvent('notify', {detail:{'message':this.someText}});
       this.dispatchEvent(custEvent);
   
  }

}