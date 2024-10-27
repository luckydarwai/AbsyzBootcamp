import { LightningElement } from 'lwc';

export default class ChildComp extends LightningElement {

   displayURL='';

    handleClick(event)
    {
        let name = event.target.name;
        let value = event.target.value;

        if (name==='absyz') {
            this.displayURL = value;
        }
        else if (name==='trailhead') {
            this.displayURL = value;
            
        }


        let ev = new CustomEvent('showlink',{
            detail : {
                message:this.displayURL
            }
        });
        this.dispatchEvent(ev);
    }
}