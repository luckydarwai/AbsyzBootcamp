import { LightningElement,wire } from 'lwc';
import getContactsRecord from '@salesforce/apex/contactController.getContactsRecord';

export default class Assignment29T6 extends LightningElement {

   @wire(getContactsRecord)
   contacts;

}