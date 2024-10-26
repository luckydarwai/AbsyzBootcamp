import { LightningElement } from 'lwc';

export default class Assignment29T10Parent extends LightningElement {
    someText='Type Somthing in Above Field';

    childText='Type Somthing in Above Field';

    textHandler(event)
    {
         this.someText = event.target.value;
    }


    handleNotify(event) {
        console.log(event.detail.message);

        this.childText = event.detail.message;
    }
}