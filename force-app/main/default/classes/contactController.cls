public with sharing class contactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsByAccountId(Id accountId) {
        return [
            SELECT Id, Name, Title, Phone, Email, Owner.Name 
            FROM Contact 
            WHERE AccountId = :accountId
        ];
    }


    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsRecord()
    {
        return [SELECT Id, Name, Title, Phone, Email FROM Contact];
    }


    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(){
        List<Contact> conList = [SELECT Id,Name,FirstName,LastName,Title,Phone,Email,PhotoUrl FROM Contact WHERE PhotoUrl != null with USER_MODE LIMIT 10];
        return conList;
    }
}           