public class AsyncApex {

    public static void dmlOperations()
    {
        
        Account a = new Account();
        a.Name = 'Lucky';
        a.AnnualRevenue = 10000;
        insert a;      
        
      
        futureMethod();
    }
     @future
     public static void futureMethod()
     {
           Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];
        User usr = new User(alias = 'apexs', email='apex@apexhours.com', 
            emailencodingkey='UTF-8', lastname='Hours', 
            languagelocalekey='en_US', 
            localesidkey='en_US', profileid = p.Id, userroleid = r.Id,
            timezonesidkey='America/Los_Angeles', 
            username='testuser1@testUser1');
        insert usr;
     }
}