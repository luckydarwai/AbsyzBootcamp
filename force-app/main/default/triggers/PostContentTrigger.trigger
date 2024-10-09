trigger postContent on Post__c (before insert , after insert , after update) {

   
    if(trigger.isAfter && trigger.isUpdate){
      //trigger.new
      
      PostTriggerHandler.beforeInsert(trigger.new);
    }
}


