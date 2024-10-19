import { LightningElement } from 'lwc';

export default class Calculator extends LightningElement {
    numberOne = "";
    numberTwo = "";
    result = 0;
    dispalyOutput = false;

//  changeHandlerNumberOne(event){
//    this.numberOne = event.target.value;
//    console.log("NumberOne ",this.numberOne);
   
// }
// changeHandlerNumberTwo(event){
//     this.numberTwo = event.target.value;
//     console.log("NumberTwo ",this.numberTwo);
//  }

    
 changeHandler(event)
   {
    if (event.target.name=='number1') {
        this.numberOne = event.target.value;
    }
    else if (event.target.name=='number2') {
        this.numberTwo = event.target.value;
    } 
   }
  
   

    // addHandler(event){
    //  this.result = parseInt(this.numberOne) + parseInt(this.numberTwo);
    // }

    // subHandler(event){
    //     this.result = parseInt(this.numberOne) - parseInt(this.numberTwo);
    // }

    // mulHandler(event){
    //     this.result = parseInt(this.numberOne) * parseInt(this.numberTwo);
    // }

    // divHandler(event){
    //     this.result = parseInt(this.numberOne) / parseInt(this.numberTwo);
    // }



    calculateInput(event){
        this.dispalyOutput = true;
        let labelelement = event.target.label;
        if (labelelement=="Add") {
            this.result = parseInt(this.numberOne) + parseInt(this.numberTwo);
        }
        else if(labelelement=="Sub"){
            this.result = parseInt(this.numberOne) - parseInt(this.numberTwo);
        }
        else if(labelelement=="Mul"){
            this.result = parseInt(this.numberOne) * parseInt(this.numberTwo);
        }
        else if(labelelement=="Div"){
            this.result = parseInt(this.numberOne) / parseInt(this.numberTwo);
        }


    // Reset Input Fields 
    this.numberOne = '';
    this.numberTwo = '';
    }
}