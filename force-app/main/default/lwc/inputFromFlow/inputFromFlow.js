import {LightningElement ,api} from 'lwc';
import {FlowAttributeChangeEvent} from 'lightning/flowSupport';
export default class InputFromFlow extends LightningElement {
    
   @api inputName;
    changeHandler(event)
    {
        this.inputName = event.target.value;
        const attributeEvent= new FlowAttributeChangeEvent("inputName",this.inputName);
        this.dispatchEvent(attributeEvent);
    }
}