import { LightningElement,wire } from 'lwc';
import { publish, MessageContext } from 'lightning/messageService';
import MESSAGE_CHANNEL from '@salesforce/messageChannel/sendMessage__c';

export default class Component1 extends LightningElement {

@wire(MessageContext)
messageContext;


handleInputChange(event) {
    const message = {
        messageBody: event.target.value
    };
    publish(this.messageContext, MESSAGE_CHANNEL, message);
}
}