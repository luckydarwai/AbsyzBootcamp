public with sharing class contactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactsByAccountId(Id accountId) {
        return [
            SELECT Id, Name, Title, Phone, Email, Owner.Name 
            FROM Contact 
            WHERE AccountId = :accountId
        ];
    }
}           