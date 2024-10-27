public with sharing class AccountController {
    
  
    @AuraEnabled
    public static List<Account> getAccountList()
    {
       List<Account> acc = [SELECT Id, Name FROM Account];
        return [SELECT Id, Name FROM Account];

    }

    @AuraEnabled
    public static void saveContactRecord(Contact con){
        System.debug('acc--'+con);
        try{
            insert con;
        }
        catch(Exception ex) {
            throw new AuraHandledException(ex.getMessage());
        }
    }


    @AuraEnabled(cacheable=true)
    public static List<Account> getParentAccounts(){
        return [Select Id,Name,Industry from Account where AnnualRevenue != null WITH USER_MODE];
    }

    


 // Assignment - 29 Task 14

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [SELECT Id, Name, AccountNumber, Phone, Industry, AnnualRevenue FROM Account LIMIT 10];
    }

}