trigger MerchandiseTrigger on Merchandise__c (before update,after update) {

  if (trigger.isBefore) {
    if (trigger.isInsert) 
    {
        
    }
    else if(trigger.isUpdate)
    {
       
      
    }
    else if(trigger.isDelete)
    {

    }
  }
  else if(trigger.isAfter)
  {
    if(trigger.isInsert)
    {

    }
    else if(trigger.isUpdate)
    {
        MerchandiseTriggerHandler.task4(trigger.new,trigger.old);
       
    }
    else if(trigger.isDelete)
    {

    }
    else if(trigger.isUndelete)
    {

    }
  }

}