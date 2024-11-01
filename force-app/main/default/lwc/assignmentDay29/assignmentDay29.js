import { LightningElement } from 'lwc';

export default class AssignmentDay29 extends LightningElement {

    name = "Lucky Darwai";
    showTextVar = false;

    showText(){
       this.showTextVar = !this.showTextVar;
       console.log('showTextVar'+this.showTextVar);
       
    }
}