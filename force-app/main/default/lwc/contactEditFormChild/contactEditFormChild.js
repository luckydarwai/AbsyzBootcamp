import { LightningElement,api } from 'lwc';

export default class ContactEditFormChild extends LightningElement {
  
  @api  firstName;
  @api  lastName;
  @api  email;
  @api  phone;
  @api  dob;
  @api  accountName;
  
  
  onEditField(){
    // console.log("This is Clicked********");
    
    let conObject = {
      firstName : "Lucky",
      lastName : "Darwai",
      email : "Lucky@gmail.com",
    }
    let custEvent = new CustomEven('edit',{details : conObject});
    this.dispatchEvent(custEvent);
  }

  @api
  callMeFromParent()
  {
    alert('Child funciton is called from the parent' );  
  }
}