import { LightningElement } from 'lwc';

export default class ChildCustomEventDemo extends LightningElement {

    clickHandler(){
      //1. create of custom Event

      let mycustomEvent = new CustomEvent("displaymsg");

      //2. dispatch the event

      this.dispatchEvent(mycustomEvent);
    }
}