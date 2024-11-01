@isTest
public class AccountTriggerHandlerTest {
    
    @isTest
    public static void updateRatingTest()
    {

        List<Account> accList = new List<Account>();
        List<String> industry = new List<String>{'Agriculture','Consulting','Electronics'};

       for (Integer i = 0; i < 3; i++) {
           Account acc = new Account();
           acc.Name = 'Hackathon Test '+i;
           acc.Industry = industry[i];
           acclist.add(acc);
       }
      Test.startTest();
       insert accList;
       Test.stopTest();

       // List<String> rating = new List<String>{'Hot','Cold','Warm'}
       List<Account> accToBeUpdated = [SELECT Id, Rating From Account WHERE Id =:accList[0].id ];
         
       System.assertEquals('Hot',accToBeUpdated[0].Rating);
         
    }
}