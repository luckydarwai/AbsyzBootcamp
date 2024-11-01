@isTest
public class AccountTest {
    
    // Test method to verify account creation
    @isTest
    static void testCreateAccount() {
        // Set up test data
        Account testAccount = new Account(
            Name = 'Test Account',
            Phone = '123-456-7890',
            Industry = 'Technology'
        );

        // Insert the test account
        Test.startTest();
        insert testAccount;
        Test.stopTest();

        // Verify the account was created
        Account insertedAccount = [SELECT Id, Name, Phone, Industry FROM Account WHERE Id = :testAccount.Id];

        // Assertions to ensure the account was created as expected
        System.assertNotEquals(null, insertedAccount, 'The inserted account should not be null');
        System.assertEquals('Test Account', insertedAccount.Name, 'The account name should match');
        System.assertEquals('123-456-7890', insertedAccount.Phone, 'The account phone should match');
        System.assertEquals('Technology', insertedAccount.Industry, 'The account industry should match');
    }
}