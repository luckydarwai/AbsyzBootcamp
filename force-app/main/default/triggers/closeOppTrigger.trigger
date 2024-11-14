trigger closeOppTrigger on Account (after update) {
   
    // Set<Id> accIds = new Set<Id>();
    //  if (trigger.isAfter && trigger.isUpdate) {
    //     if (!trigger.new.isEmpty()) {
    //         for (Account acc  : trigger.new) {
    //             accIds.add(acc.Id);
    //         }
    //     }
    //  }

    //  List<Opportunity> oppToBeUpdated = new List<Opportunity>();
    //  if (!accIds.isEmpty()) {
    //       List<Opportunity> oppList = [Select AccountId,StageName,Test_Created_Date__c from Opportunity where AccountId in : accIds]; 
          
    //       if (!oppList.isEmpty()) {
    //         Date  day30 =  date.today() - 30;
     
    //         for (Opportunity opp : oppList) {
    //                if (opp.Test_Created_Date__c < day30 && opp.StageName != 'Closed Won') {
    //                  opp.StageName = 'Closed Lost';
    //                  opp.closeDate = date.today();
    //                  oppToBeUpdated.add(opp);
    //                }
    //         }
    //       }
    //  }  
   
    //  if (!oppToBeUpdated.isEmpty()) {
    //     update oppToBeUpdated;
    //  }

}