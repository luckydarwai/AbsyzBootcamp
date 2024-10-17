import { LightningElement,api } from 'lwc';

export default class ChildComponent extends LightningElement {
  @api display;
  @api displayGretting;
  // @api user;
  @api isUserAvailable=false;

  displayuser;


  set user(value){
    let cloneuser = {...value};
    this.displayuser = cloneuser.firstname.toUpperCase();
  }


  @api
  get user(){
    return this.displayuser;
  }
}