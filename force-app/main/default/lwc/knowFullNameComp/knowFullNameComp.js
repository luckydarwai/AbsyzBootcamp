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
      console.log('first Name'+this.firstname);
      console.log('last Name'+this.lastname);
      console.log('full Name'+this.fullname);
      
    }


    uName(event)
    {
      console.log('name calling-----------');
      
    let name = event.target.name;
    console.log(name);
    
     if (name == 'firstname') {
         this.firstname = event.target.value;
         console.log('first name',this.firstname);
         
        }
        else if(name == 'lastname')
          {
       this.lastname = event.target.value;

       console.log('last name',this.lastname);
       

     }
    }


}