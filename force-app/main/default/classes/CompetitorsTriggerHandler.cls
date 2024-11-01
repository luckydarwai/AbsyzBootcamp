public with sharing class CompetitorsTriggerHandler {
 
    public static void task8(List<Competitor__c> restoredCompetitors)
    {
       
    List<Competitor__c> competitorsToUpdate = new List<Competitor__c>();
    
     for (Competitor__c competitor : restoredCompetitors) {

        if (competitor != null  && competitor.Id != null) {
            

            competitor.Undeleted_Record__c = true;
            competitorsToUpdate.add(competitor);
        }
       
     }


     if (!competitorsToUpdate.isEmpty()) {
        try {
            update competitorsToUpdate;
        } catch (DmlException e) {
            System.debug('Error updating competitors: ' + e.getMessage());
            // Handle or log the exception as needed
        }
    }


    }
}