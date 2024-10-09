public with sharing class MerchandiseTriggerHandler {
    public MerchandiseTriggerHandler() {
      // Constructor----
    }


    // 4) Create a trigger to double the Unit Price on all Line Items when Merchandise Quantity is changed to
    // 20.
    

    public static void task4(List<Merchandise__c> newValue,List<Merchandise__c> oldValue){


      /*  

        List<Line_Item__c> lineItemsToUpdate = new List<Line_Item__c>();

        // List<LineItem__c> lItem = [SELECT ID, Name, Unit_Price__c FROM LineItem__c WHERE ID in : newValue.ID] ;
      
       for (Integer i = 0; i < newValue.size(); i++) {
        Merchandise__c newMerch = newValue[i];
        Merchandise__c oldMerch = oldValue[i];

        // Check if Quantity__c was updated to 20
        if (newMerch.Quantity__c == 20 && oldMerch.Quantity__c != 20) {
            // Query related LineItems
            List<Line_Item__c> relatedLineItems = [
                SELECT Id, Name, Unit_Price__c 
                FROM Line_Item__c 
                WHERE Merchandise__c = :newMerch.Id
            ];

            // Double the Unit Price of related LineItems
            for (Line_Item__c lineItem : relatedLineItems) {
                lineItem.Unit_Price__c = lineItem.Unit_Price__c * 2;
                lineItemsToUpdate.add(lineItem);
            }
        }
    }
    if (lineItemsToUpdate.size()>0) {
        update lineItemsToUpdate;
    }

    */




    List<Line_Item__c> lineItemsToUpdate = new List<Line_Item__c>();

    
        Set<Id> merchadiseIdsToProcess = new Set<Id>();

        for (Integer i = 0; i < newValue.size(); i++) {
            Merchandise__c newMerch = newValue[i];
            Merchandise__c oldMerch = oldValue[i];


            if (newMerch.Quantity__c == 20 && oldMerch.Quantity__c != 20) {
                merchadiseIdsToProcess.add(newMerch.Id);
            }
        }


        if (!merchadiseIdsToProcess.isEmpty()) {
             lineItemsToUpdate = [SELECT Id, Unit_Price__c, Merchandise__c FROM Line_Item__c WHERE Merchandise__c In:merchadiseIdsToProcess];
        }
        


        for (Line_Item__c lineItem : lineItemsToUpdate) {
            lineItem.Unit_Price__c = lineItem.Unit_Price__c * 2;
            
        }


        if (!lineItemsToUpdate.isEmpty()) {
            update lineItemsToUpdate;
        }


    }
}