public with sharing class OpportunityTriggerHandler {
    public static void task7(List<Opportunity> deleteOpp)
    {      
        // Way one
        // List<Competitor__c> listName = [SELECT ID FROM Competitor__c WHERE Opportunity__c IN : deleteOpp];
        
        // if (!listName.isEmpty()) {
        //     delete listName;
        // }
        // Way Two for multiple items at a time.     
        Set<Id> oppIds = new Set<Id>();
        for (Opportunity opp : deleteOpp) {
            oppIds.add(opp.Id);
        }
        List<Competitor__c> competitorsToDelete = [SELECT ID FROM Competitor__c WHERE Opportunity__c IN : oppIds];
        
        if (!competitorsToDelete.isEmpty()) {
            delete competitorsToDelete;
        }      
    }
    
    
    
    public static void showMaxAmountOppNameOnAccount(List<Opportunity> newOpp,Map<Id,Opportunity> oldMap)
    {
        Set<Id> accIds = new Set<Id>();
        if (!newOpp.isEmpty()) {
            for (Opportunity opp  : newOpp) {
                // this is for update
                if (oldMap != null) {
                    Opportunity oldOpp = oldMap.get(opp.Id);
                    if (opp.AccountId != oldOpp.AccountId) {
                        accIds.add(oldOpp.AccountId);
                        accIds.add(opp.AccountId);
                    }
                   
                    else {
                        accIds.add(opp.AccountId);
                    }
                }
                //this is for create and undelete
                else{
                    accIds.add(opp.AccountId);
                }
            }
        }
        
        List<Account> accToBeUpdated = new List<Account>();         
        if (!accIds.isEmpty()) {
            List<Account> accList = [SELECT maxOpp__c,(SELECT Name,Amount from Opportunities where Amount != null order by Amount desc limit 1) From Account where Id in : accIds];
            
            if (!accList.isEmpty()) {
                for (Account acc : accList) {
                    if (!acc.Opportunities.isEmpty()) {
                        acc.maxOpp__c = acc.Opportunities[0].Name; 
                        accToBeUpdated.add(acc);   
                        
                    }
                    else{
                        acc.maxOpp__c = '';
                        accToBeUpdated.add(acc);  
                    }      
                    
                }
            }
        
       if (!accToBeUpdated.isEmpty()) {
           update accToBeUpdated;
       }

        }
        
    }
}