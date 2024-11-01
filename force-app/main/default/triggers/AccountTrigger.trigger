trigger AccountTrigger on Account (before insert,before update,before delete,after update) {
    
    // if (trigger.isBefore) {
    //     if (trigger.isInsert || trigger.isUpdate) {
    //         AccountTriggerHandler.task1(trigger.new);
            
    //     }
        // else if(trigger.isDelete)
        // {
        //     AccountTriggerHandler.task9(trigger.old);
        // }
    // }
    
 if(trigger.isAfter && trigger.isUpdate)
   {
        // AccountTriggerHandler.parentAccountTrigger(trigger.new,trigger.oldMap);
        
        AccountTriggerHandler.updateChild(trigger.new,trigger.oldMap);       


  }


}