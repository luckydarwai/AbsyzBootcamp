trigger AccountRecordTrigger on Account (before update,after update) {
    
    
    
    // Trigger Learning 
    
    
    if (Trigger.isAfter) {
        if (Trigger.isUpdate) {
         
            AccountHandler.updateOpportunityPhone(Trigger.new,Trigger.oldMap);  
          
          
            if (!PreventRecursion.firstCall)             
            {  
              
                PreventRecursion.firstCall = true;
                AccountHandler.updateAccount(Trigger.new,Trigger.oldMap);
                
            }



        }
    } 
    
    
    
    
    
    
    
    
    
    
    
    if (trigger.isBefore && trigger.isUpdate) {
        // Double annualRev = 0;               
        

        
        for (Account acc : trigger.new) {
            
            if (trigger.oldMap.get(acc.Id).AnnualRevenue != trigger.newMap.get(acc.Id).AnnualRevenue) {
                
                acc.Description = 'Old value : ' + trigger.oldMap.get(acc.Id).AnnualRevenue + ' New Value : ' + trigger.newMap.get(acc.Id).AnnualRevenue;
            }
        }
    }
    
}