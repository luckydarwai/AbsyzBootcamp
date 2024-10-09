public with sharing class LineItemTriggerHandler {
  
        public static void task5(List<Line_Item__c> newItems, List<Line_Item__c> oldItems, Boolean isInsert, Boolean isUpdate, Boolean isDelete, Boolean isUndelete) {
        Set<Id> merchandiseIds = new Set<Id>();
            
        if (isInsert || isUpdate || isUndelete) {
            for (Line_Item__c li : newItems) merchandiseIds.add(li.Merchandise__c);
        }
        if (isDelete) {
            for (Line_Item__c li : oldItems) merchandiseIds.add(li.Merchandise__c);
        }

        updateMerchandiseLineItemCount(merchandiseIds);
    }

    private static void updateMerchandiseLineItemCount(Set<Id> merchandiseIds) {
        if (merchandiseIds.isEmpty()) return;
    
        List<AggregateResult> results = [
            SELECT Merchandise__c, COUNT(Id) NoOfLineItem
            FROM Line_Item__c 
            WHERE Merchandise__c IN :merchandiseIds 
            GROUP BY Merchandise__c
        ];
    
        List<Merchandise__c> updates = new List<Merchandise__c>();
        for (AggregateResult ar : results) {
            updates.add(new Merchandise__c(
                Id = (Id) ar.get('Merchandise__c'), 
                NoOfLineItems__c = (Integer) ar.get('NoOfLineItem')
            ));
        }
        
        Set<Id> updatedMerchandiseIds = new Set<Id>();
        for (Merchandise__c m : updates) {
            updatedMerchandiseIds.add(m.Id);
        }
        
        for (Id merchandiseId : merchandiseIds) {
            if (!updatedMerchandiseIds.contains(merchandiseId)) {
                updates.add(new Merchandise__c(Id = merchandiseId, NoOfLineItems__c = 0));
            }
        }
        
        
        update updates;
    }
    
}