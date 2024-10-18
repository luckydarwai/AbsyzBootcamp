import { LightningElement } from 'lwc';

export default class KnowFullNameComp extends LightningElement {
  firstname;
  lastname;
  fullname;
  knowFullName()
  {
    console.log("Button Tapped ----------->");
    
    let fname;
    fname = this.firstname + this.lastname;
    this.fullname = fname.toUpperCase();
    
    
  }
  
  
  uName(event)
  {
    
    
    let name = event.target.name;
    console.log(name);
    
    if (name == 'firstname') {
      this.firstname = event.target.value;
      
      
    }
    else if(name == 'lastname')
      {
      this.lastname = event.target.value;
      
      
      
    }
  }
  
  
}