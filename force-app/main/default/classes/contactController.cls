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
}           