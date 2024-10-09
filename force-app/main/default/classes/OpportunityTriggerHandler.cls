public with sharing class OpportunityTriggerHandler {
    public OpportunityTriggerHandler() {
        // Constructor 
    }

    // 7) Create a trigger to delete Competitors records when the opportunity gets deleted.

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
}