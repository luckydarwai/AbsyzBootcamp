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
    

}