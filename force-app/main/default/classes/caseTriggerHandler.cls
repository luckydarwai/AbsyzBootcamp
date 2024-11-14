public with sharing class caseTriggerHandler {
    
    public static void updateCaseNumber(List<Case> caseList){
        
        Set<Id> accIds = new Set<Id>(); 
        
        if (!caseList.isEmpty()) {
            
            for (Case c : caseList) {
                if (c.AccountId != null) {
                    accIds.add(c.AccountId);
                }
            }
        }
        List<Account> accToBeUpdated = new List<Account>();

        if (!accIds.isEmpty()) {
            
            Map<Id, Account> accMap = new Map<Id, Account>([Select Id,Latest_Case_Inserted__c from Account where Id in : accIds]);
            
            if (!caseList.isEmpty()) {
                for (Case c  : caseList) {
                    if (accMap.containsKey(c.AccountId)) {
                        Account acc = accMap.get(c.AccountId);
                        if (acc.Latest_Case_Inserted__c != c.CaseNumber) {
                            acc.Latest_Case_Inserted__c = c.CaseNumber;
                            accToBeUpdated.add(acc);
                        }
                       
                    }
                }
            }
        }

        if (!accToBeUpdated.isEmpty()) {
            update accToBeUpdated;
        }
    }
}