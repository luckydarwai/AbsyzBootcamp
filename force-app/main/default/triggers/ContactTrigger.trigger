trigger ContactTrigger on Contact (after insert,after update,after delete,before insert,before update) {
      
    // I have Commented the task 6 due to Assignment 3 Task 1  
    // if (Trigger.isAfter) {
    //     ContactTriggerHandler.task6(Trigger.new); //,Trigger.old
    // } 
    
    if (Trigger.isAfter) {
            // if (Trigger.isUpdate || Trigger.isInsert) {
            //     ContactTriggerHandler.updateActiveContactOnAccount(Trigger.new,Trigger.oldMap);
            // }

        // if (Trigger.isInsert) {
        //     ContactTriggerHandler.updateTotalValueOnAccount(Trigger.new, null); // Pass null for oldMapCon during insert
        // } else if (Trigger.isUpdate) {
        //     ContactTriggerHandler.updateTotalValueOnAccount(Trigger.new, Trigger.oldMap); // Pass oldMap for update
        // }
        // if (Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete) {
            
        //     ContactTriggerHandler.assignment_3_task1(Trigger.new,Trigger.old);        
        // }        
        // if (Trigger.isInsert) {
        //     ContactTriggerHandler.createDriverAndClient(Trigger.new);
        // }


       //SFDC Practice
        // ContactTriggerHandler.updateAccountDescription(trigger.new,trigger.oldMap);
        
    }
    
    if (Trigger.isBefore) {
       
    //     if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate)) {
    //         ContactTriggerHandler.updateSetupAndNonSetupObject(Trigger.new,Trigger.old);
    //     }

        
    //     if (Trigger.isInsert || Trigger.isUpdate) {
            
    //         ContactTriggerHandler.vehicleFieldRequired(Trigger.new);
    //     }
        
    //     if (Trigger.isUpdate) {
    //         ContactTriggerHandler.preventChangingType(Trigger.new,Trigger.oldMap);
    //     }
        
        
        
    }
    
    
}