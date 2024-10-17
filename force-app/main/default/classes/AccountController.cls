public with sharing class AccountController {
    @AuraEnabled
    public static List<Account> getAccountList()
    {
       List<Account> acc = [SELECT Id, Name FROM Account];
        return [SELECT Id, Name FROM Account];

    }
}