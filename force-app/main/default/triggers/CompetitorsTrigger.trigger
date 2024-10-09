trigger CompetitorsTrigger on Competitor__c (after undelete) {


  
        CompetitorsTriggerHandler.task8(trigger.new);
   

}