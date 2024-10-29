public with sharing class ContactTriggerHandler {
    
    // public static void task6(List<Contact> contacts)
    // {
    //   Set<Contact> contactId = new Set<Contact>();
    
    //   for (Contact con : contacts) {
    //     contactId.add(con.Id);
    //   }
    
    
    // }
    
    
    
    
    
    public static void assignment_3_task1(List<Contact> newContacts, List<Contact> oldContacts) {
        Set<Id> accountIds = new Set<Id>();
        
        if (newContacts != null) {
            for (Contact c : newContacts) {
                if (c.AccountId != null) accountIds.add(c.AccountId);
            }
        }
        if (oldContacts != null) {
            for (Contact c : oldContacts) {
                if (c.AccountId != null) accountIds.add(c.AccountId);
            }
        }
        
        List<AggregateResult> results = [
        SELECT AccountId, COUNT(Id) activeCount        // Aliaass
        FROM Contact
        WHERE AccountId IN :accountIds AND Active__c = true
        GROUP BY AccountId
        ];
        
        
        Map<Id, Integer> activeCountMap = new Map<Id, Integer>();
        
        for (AggregateResult ar : results) {
            activeCountMap.put((Id)ar.get('AccountId'), (Integer)ar.get('activeCount'));
        }
        
        
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accountId : accountIds) {
            Integer activeCount = activeCountMap.get(accountId) != null ? activeCountMap.get(accountId) : 0;
            accountsToUpdate.add(new Account(Id = accountId, Active_Contact_Count__c = activeCount));
        }
        
        
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    //Assignment 3 Question 2 
    
    public static void vehicleFieldRequired(List<Contact> newRecs) {
        for(Contact con : newRecs) {
            if(con.Selected_Type__c != null && con.Vehicle_Number__c == null) {
                con.addError('Please fill Vehicle Number');
            }
        }
    }
    
    
    public static void preventChangingType(List<Contact> newRecs, Map<Id,Contact> oldRecMap) {
        for(Contact con : newRecs) {
            if(oldRecMap.get(con.Id).Selected_Type__c !=null && con.Selected_Type__c != null && oldRecMap.get(con.Id).Selected_Type__c != con.Selected_Type__c) {
                con.addError('Type cannot be changed');
            }
        }
    }
    
    
    public static void createDriverAndClient(List<Contact> newRecs) {
        for(Contact con : newRecs) {
            if(con.Selected_Type__c == 'Client') {
                List<Client__c> clientList = new List<Client__c>();
                Client__c client = new Client__c();
                client.Name = con.FirstName + ' ' + con.LastName;
                client.Phone_Number__c = con.Phone;
                client.Related_Contact__c = con.Id;
                client.Vehicle_Number__c = con.Vehicle_Number__c;
                clientList.add(client);
                if(!clientList.isEmpty()) {
                    Database.insert(clientList, false);
                }
            } else if(con.Selected_Type__c == 'Driver') {
                List<Driver__c> driverList = new List<Driver__c>();
                Driver__c driver = new Driver__c();
                driver.Name = con.FirstName + ' ' + con.LastName;
                driver.Phone_Number__c = con.Phone;
                driver.Related_Contact__c = con.Id;
                driver.Vehicle_Number__c = con.Vehicle_Number__c;
                driverList.add(driver);
                if(!driverList.isEmpty()) {
                    Database.insert(driverList, false);
                }
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    // Assignmnet - 22 New 
    public static void updateTotalValueOnAccount(List<Contact> newConList, Map<Id, Contact> oldMapCon) {
        // List<Contact> conList = new List<Contact>();
        // Set<Id> conIds = new Set<Id>();
        Set<Id> accountIds = new Set<Id>();
        
        for (Contact con : newConList) {
            
            if (oldMapCon != null && oldMapCon.containsKey(con.Id)) {
                
                if ( con.phone != null && con.Value__c != null && oldMapCon.get(con.Id).Value__c != null && con.Value__c != oldMapCon.get(con.Id).Value__c) {
                    // conList.add(con);
                    // conIds.add(con.Id);
                    accountIds.add(con.AccountId);
                }
            } else {
                
                if (con.Value__c != null && con.phone != null) {
                    // conList.add(con);
                    // conIds.add(con.Id);
                    accountIds.add(con.AccountId);
                }
            }
        }
        
        if (!accountIds.isEmpty()) {
            List<AggregateResult> aggrResult = [SELECT AccountId, SUM(Value__c) totalValueCount 
            FROM Contact 
            WHERE AccountId IN :accountIds 
            GROUP BY AccountId];
            
            Map<Id, Decimal> accConCount = new Map<Id, Decimal>();
            
            for (AggregateResult aggr : aggrResult) {
                accConCount.put((Id) aggr.get('AccountId'), (Decimal) aggr.get('totalValueCount'));
            }
            
            List<Account> accountsToUpdate = new List<Account>();
            
            for (Id accountId : accountIds) {
                Decimal totalSum = accConCount.get(accountId) != null ? accConCount.get(accountId) : 0;
                accountsToUpdate.add(new Account(Id = accountId, Total_Value__c = totalSum));
            }
            
            if (!accountsToUpdate.isEmpty()) {
                update accountsToUpdate;
            }
        }
    }
    
    
    
    
    
    
    
    // Best Practicesss 
    
    public static void updateSetupAndNonSetupObject(List<Contact> contacts,List<Contact> oldCon){
        
        
        Map<String, Contact> emailToContactMap = new Map<String, Contact>();
        
        for (Contact contact : contacts) {
            if (contact.Email != null) {
                emailToContactMap.put(contact.Email, contact);
            }
        }
        
        
        List<User> usersToUpdate = [SELECT Id, Email, Name FROM User WHERE Email IN :emailToContactMap.keySet()];
        
        for (User user : usersToUpdate) {
            Contact relatedContact = emailToContactMap.get(user.Email);
            
            
            user.Email = relatedContact.Email;
            //  user.Name = relatedContact.FirstName + ' ' + relatedContact.LastName;
        }
        
        
        if (!usersToUpdate.isEmpty()) {
            try {
                update usersToUpdate;
            } catch (DmlException e) {
                System.debug('Error updating User records: ' + e.getMessage());
            }
        }
        
        
        
        
        
        
    }
    
    
    
    
    
    
    public static void updateActiveContactOnAccount(List<Contact> newConList, Map<Id,Contact> oldMap)
    {
        
        
        Set<Id> accIds = new Set<Id>();
        
        for (Contact con : newConList) {
            accIds.add(con.accountId);        
        }
        
        
        Map<Id, Account> mapName = new Map<Id, Account>();
        
        
        // List<AggregateResult> aggrResult = [SELECT AccountId, SUM(Status__c) totalActiveCount 
        // FROM Contact 
        // WHERE AccountId IN :accountIds 
        // GROUP BY AccountId];
        
        
        List<Account> accountList = [Select Id,Name,Active_Contact_Count__c ,(Select Id, Name From Contacts where Active__c=true) From Account WHERE Id IN:accIds];
        
        
        
        System.enqueueJob(new updateAccountViaQuable(accountList));
        
        
        
    }
    
    
}








/*
trigger.new

set for Account Id storing

contact List = [select Id,name,primary_contact contact where accid in : set and id not in : trigger.new]



*/