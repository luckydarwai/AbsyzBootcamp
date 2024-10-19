import { LightningElement } from 'lwc';

export default class ToDoApplication extends LightningElement {
    
    taskname = ''
    taskdate = null;
    incompletetask = [];
    completetask = [];
    
    changeHandler(event){
        let {name,value} = event.target;
        if (name === 'taskname') {
            this.taskname = value;
        }
        else if(name === 'taskdate')
            {
            this.taskdate = value;
        }
    }
    
    
    resetHandler(){
        this.taskname = '';
        this.taskdate = null;
    }
    
    
    addTaskHandler(){
    if(!this.taskdate)
        {
            this.taskdate = new Date().toISOString().slice(0,10);  //  Assigning Current Date
            
        }

        if (this.validateTask()) {
            this.incompletetask = [
                ...this.incompletetask,
                {
                    taskname:this.taskname,
                    taskdate:this.taskdate
                }
            ];

            this.resetHandler();
            let sortedArray =  this.sortTask(this.incompletetask);
            this.incompletetask = [...sortedArray];

            console.log('incompletetask : ',this.incompletetask);
            
        }
    }
    

    validateTask(){
        let isValid = true;
        let element = this.template.querySelector('.taskname');

        if(!this.taskname){
            isValid = false;
        }
        else{
          let taskItem =  this.incompletetask.find(
            (currItem)=>
                currItem.taskname === this.taskname &&
                currItem.taskdate === this.taskdate
            );
         
            console.log('duplicate taskitem ',taskItem);
            
            if (taskItem) {
                isValid = false;
                element.setCustomValidity("Task is already Available");
            }
        }

        if (isValid) {
            element.setCustomValidity("");
        }
        element.reportValidity();
        return isValid;
    }


    sortTask(inputArr)
    {
     let sortedArray =   inputArr.sort((a,b)=>{
            const dateA = new Date(a.taskdate);
            const dateB = new Date(b.taskdate);
            return dateA - dateB;
        });

        return sortedArray;
    }
   

    removalHandler(event)
    {
     // remove the item, from incomplete task arry

     console.log('tapped');
     
     let index = event.target.name;   
     this.incompletetask.splice(index,1);
     let sortedArray =  this.sortTask(this.incompletetask);
     this.incompletetask = [...sortedArray];
     console.log('incompletetask : ',this.incompletetask);
    }

    completetaskHandler(event)
    {
      // remove the item, from incomplete task arry  
      // add the same entry in complete item

      let index = event.target.name;
      this.refreshData(index);
    }



     dragStartHandler(event)
     {
        event.dataTransfer.setData("index",event.target.dataset.item);
     }

     allowDrop(event)
     {
        event.preventDefault();
     }

     dropElementHandler(event){
      let index =  event.dataTransfer.getData("index");
      this.refreshData(index);
     }

     refreshData(index){
        let removeItem = this.incompletetask.splice(index,1);
        let sortedArray =  this.sortTask(this.incompletetask);
        this.incompletetask = [...sortedArray];
        console.log('incompletetask : ',this.incompletetask);
        this.completetask = [...this.completetask, removeItem[0]];
     }
}