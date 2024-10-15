public with sharing class OpportunityLWCController {
    
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getOpportunities(){
        List<Opportunity> allOpportunities = [SELECT Id, Name, Amount, StageName, Type FROM Opportunity limit 10];
        return allOpportunities;
    }
    
    
    @AuraEnabled
    public static ContactLeadWrapper getContactsLeads(String email){
        ContactLeadWrapper conLeadWrap = new ContactLeadWrapper();


        List<Contact> contactList = [SELECT Id, Name, Phone, Email FROM Contact Where Email =:email];
        List<Lead> leadList = [SELECT Id, Name, Phone, Email FROM Lead Where Email =:email];
        conLeadWrap.contacts = contactList;
        conLeadWrap.leads = leadList;

        return conLeadWrap;
    }
    


    public class ContactLeadWrapper{
        @auraEnabled public List<Contact> contacts;
        @auraEnabled public List<Lead> leads;
    }
}