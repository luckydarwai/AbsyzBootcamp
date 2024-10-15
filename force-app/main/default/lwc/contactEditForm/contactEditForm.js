import { LightningElement } from 'lwc';

export default class ContactEditForm extends LightningElement {
     firstName;
     lastName;
     email;
     phone;
     dob;
     accountName;
     showChild=false;

     onSave(){
        // Black Function ----

        // when you use this is referes to entire js and Html documents
       this.firstName =  this.refs.firstNameElement.value;
       this.lastName =  this.refs.lastNameElement.value;
       this.email =  this.refs.emailElement.value;
       this.phone =  this.refs.phoneElement.value;
       this.dob =  this.refs.dobElement.value;
       this.accountName =  this.refs.accountNameElement.value;
    //    console.log(this.firstName);
       
       this.showChild = true;
     }


     onCancel(){
      this.firstName='';
      this.lastName='';
      this.email='';
      this.phone='';
      this.dob='';
      this.accountName='';
      this.showChild = false;
     }
}