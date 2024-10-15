import { LightningElement,api } from 'lwc';

export default class ContactEditFormChild extends LightningElement {

  @api  firstName;
  @api  lastName;
  @api  email;
  @api  phone;
  @api  dob;
  @api  accountName;
}