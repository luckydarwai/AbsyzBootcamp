@isTest
public class ContactTriggerHandlerTest {
    
    @isTest
    public static void createTest() {
        // Create an Account
        Account acc = new Account();
        acc.Name = 'Demo Account';
        insert acc;
        // Create a List of Contacts
        List<Contact> conList = new List<Contact>();
        // Insert Old Contact 1
        Contact c1 = new Contact();
        c1.FirstName = 'test';
        c1.LastName = 'contact 1';
        c1.AccountId = acc.Id;
        c1.Value__c = 10;
        conList.add(c1);

        // Insert Old Contact 2
        Contact c2 = new Contact();
        c2.FirstName = 'test';
        c2.LastName = 'contact 2';
        c2.AccountId = acc.Id;
        c2.Value__c = 10;
        conList.add(c2);
        insert conList;

        // Create Old Map
        Map<Id, Contact> oldMapCon = new Map<Id, Contact>([SELECT Id, Value__c FROM Contact WHERE Id IN :conList]);

        // Update Contact Values (simulating the new values)
        c1.Value__c = 20;
        c2.Value__c = 30;

        List<Contact> updatedContacts = new List<Contact>{c1, c2};
        update updatedContacts;

        // Run the Test
        Test.startTest();
        ContactTriggerHandler.updateTotalValueOnAccount(updatedContacts, oldMapCon);
        Test.stopTest();

        // Fetch the updated account and assert the total value is correct
        Account updatedAcc = [SELECT Total_Value__c FROM Account WHERE Id = :acc.Id];
        System.assertEquals(50, updatedAcc.Total_Value__c, 'Total value on account should be updated to 50');
    }
}
