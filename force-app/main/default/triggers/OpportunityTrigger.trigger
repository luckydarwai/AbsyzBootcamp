trigger OpportunityTrigger on Opportunity (before delete) {


    if (trigger.isBefore) {
        if (trigger.isInsert) 
        {
            
        }
        else if(trigger.isUpdate)
        {
        
        }
        else if(trigger.isDelete)
        {
            OpportunityTriggerHandler.task7(trigger.old);
        }
      }
      else if(trigger.isAfter)
      {
        if(trigger.isInsert)
        {
    
        }
        else if(trigger.isUpdate)
        {
    
        }
        else if(trigger.isDelete)
        {
           
        }
        else if(trigger.isUndelete)
        {
    
        }
      }

}