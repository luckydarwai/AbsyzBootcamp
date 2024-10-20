import { LightningElement } from 'lwc';

export default class ChildHook extends LightningElement {
  
    constructor(){
        super();
        console.log('Constructor from Child');
    }
    connectedCallback(){
        console.log('ConnectedCallback from Child');
        throw new Error('Wrror while Compoment Loading')
    }
    renderedCallback(){
        console.log('RenderedCallback from Child');
    }
    errorCallback(error,stack)
    {
        console.log('ErrorCallback from Child');
    }
    disconnectedCallback(){
        console.log('DisConnectedCallback from Child');

    }
  

}