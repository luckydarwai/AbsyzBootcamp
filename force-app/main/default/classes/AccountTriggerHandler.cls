public with sharing class AccountTriggerHandler {
    public AccountTriggerHandler() {
       // Yet to do something---------
    }
    // 1) Create a trigger on Account object to update a field Rating with value
    // a) Hot when Industry is Agriculture.
    // b) Warm when Industry is Consulting.
    // c) Cold when Industry is Electronics.
    // For every other value of Industry, set the Rating to null.
    // This trigger should fire on Insert and Update of Account record.
    
    public static void task1(List<Account> accList)
    {
        for (Account acc : accList) {
            
            if (acc.Industry == 'Agriculture') {
                acc.Rating = 'Hot'  ;
            }
            else if ( acc.Industry == 'Consulting'){
                acc.Rating = 'Warm';
            }
            else if( acc.Industry == 'Electronics'){
                acc.Rating = 'Cold';
            }
           else{
            acc.Rating = null;
           }
        }
    }


    // 9) Create a trigger to prevent an account from deleting if it has more than 3 contacts.
  
  
    public static void task9(List<Account> accounts)
    {
       Set<Id> accountIds = new Set<Id>();
       for (Account acc : accounts) {
        accountIds.add(acc.Id);
       }



       List<AggregateResult> contactCounts = [SELECT AccountId, COUNT(Id) contCounts From Contact WHERE AccountId In : accountIds Group By AccountId];


       for (AggregateResult result : contactCounts) {
          Integer totalCont = (Integer)result.get('contCounts');
          Id accountId = (Id) result.get('AccountId');

          if (totalCont > 3) {

            for (Account acc : accounts) {
                if (acc.Id==accountId)  {
                    acc.addError('This account has more than 3 contacts and cannot be deleted.');
                }
            }
            
          }
       }
   
   
   
    }







    // Assignment 03 Task Number 4 From Here

    public static void parentAccountTrigger(List<Account> acclist, Map<Id,Account> accOldMap) {
        List<Account> accToBeUpdated = new List<Account>();
        Map<Id, Account> accMap = new Map<Id, Account>();
        for(Account acc : acclist) {
            if(acc.Phone != null && acc.Phone != accOldMap.get(acc.Id).Phone) {
                accMap.put(acc.Id, acc);
            }
        }
        for(Account acc : [SELECT Id, Phone, Parent.Phone, ParentId FROM Account WHERE ParentId IN: accMap.keySet()]) {
            if(acc.ParentId != null) {
                acc.Phone = acc.Parent.Phone;
                accToBeUpdated.add(acc);
            }
        }
        if(!accToBeUpdated.isEmpty()) {
            Database.update(accToBeUpdated);
        }
    }






  //  Assignment : Day 22


  


}