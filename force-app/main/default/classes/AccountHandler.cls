public class AccountHandler {   
    
    public static void updateAccount(List<Account> newList,Map<Id,Account> oldMap)
    {
        
        List<Account> accToBeUpdated = new List<Account>(); 
        
        for (Account acc : newList) {          
            Account a = new Account(id=acc.id);
            a.Description += 'Test';
            accToBeUpdated.add(a);
        }
        
        
        if (!accToBeUpdated.isEmpty()) {
            update accToBeUpdated;
        }
    }
    
    
    
    
    public static void updateOpportunityPhone(List<Account> accList,Map<Id,Account> oldMap)
    {
        Map<Id, Account> accIdToAccountMap = new Map<Id, Account>();
        
        for (Account acc : accList) {
            
            if (oldMap != null && acc.phone != oldMap.get(acc.Id).Phone) {                
                accIdToAccountMap.put(acc.id,acc);
            }
        }

        System.debug(accIdToAccountMap);
        
        List<Opportunity> newOppToBeUpdate = new List<Opportunity>();
        List<Opportunity> oppToUpdate = [SELECT Id,Phone__c FROM Opportunity WHERE Id IN :accIdToAccountMap.keySet() ];

       for (Opportunity opp : oppToUpdate) {
        Opportunity oppor = new Opportunity();
        oppor.id = opp.id;
        oppor.Phone__c = accIdToAccountMap.get(opp.AccountId).phone;
        newOppToBeUpdate.add(oppor);
       }

        if (!newOppToBeUpdate.isEmpty()) {
            update newOppToBeUpdate;
            System.debug('********** done');
        }
    }
    
}