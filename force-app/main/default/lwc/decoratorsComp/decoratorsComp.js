import { LightningElement, track } from 'lwc';

export default class DecoratorsComp extends LightningElement {
greet = 'Welcome';
@track message = 'Good Morning ';

clickHandler(event)
{
    this.greet = 'Namaste';
    this.message = 'Good Evening';
}



@track myDetails = {fname:"Lucky",lname:"Darwai"};

nameShowHandler(event){
     this.myDetails.fname = "Abhishek";
}
}