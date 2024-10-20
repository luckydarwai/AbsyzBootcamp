import { LightningElement } from 'lwc';

export default class ParentHook extends LightningElement {
    displayChild=false;
    constructor(){
    super();
     console.log('Constructor from Parent');
     
    }
    connectedCallback(){
        console.log('ConnectedCallback from Parent');
    }
    renderedCallback(){
        console.log('RenderedCallback from Parent');
    }
    errorCallback(error,stack)
    {
        console.log('ErrorCallback from Parent');
        console.log("Error ",error);
        console.log("Stack ",stack);
    }
    disconnectedCallback(){
        console.log('DisConnectedCallback from Parent');
    }

    changeHandler(event)
    {
     this.displayChild = event.target.checked;
    }
}