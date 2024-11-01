import { LightningElement, wire } from 'lwc';
import { subscribe, MessageContext } from 'lightning/messageService';
import MESSAGE_CHANNEL from '@salesforce/messageChannel/sendMessage__c';

export default class Component2 extends LightningElement {
    receivedMessage = '';

    @wire(MessageContext)
    messageContext;

    connectedCallback() {
        this.subscribeToMessageChannel();
    }

    subscribeToMessageChannel() {
        subscribe(this.messageContext, MESSAGE_CHANNEL, (message) => {
            this.handleMessage(message);
        });
    }

    handleMessage(message) {
        this.receivedMessage = message.messageBody || 'No message received';
    }
}