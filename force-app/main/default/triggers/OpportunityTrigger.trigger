trigger OpportunityTrigger on Opportunity (before delete,after insert,after update, after delete, after undelete) {


    if (trigger.isBefore && trigger.isDelete) {    
       
            OpportunityTriggerHandler.task7(trigger.old);
        
      }
      else if (trigger.isAfter && trigger.isUpdate) {
        OpportunityTriggerHandler.showMaxAmountOppNameOnAccount(trigger.new,trigger.oldMap);
      }
      else if(trigger.isAfter && (trigger.isInsert || trigger.isUndelete))
      {
        OpportunityTriggerHandler.showMaxAmountOppNameOnAccount(trigger.new,null);
      }
      else if (trigger.isAfter && trigger.isDelete) {
        OpportunityTriggerHandler.showMaxAmountOppNameOnAccount(trigger.old,null);
      }
    

}