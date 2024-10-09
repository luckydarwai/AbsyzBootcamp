@isTest
public class AccountTriggerHandlerTest {
    
    @isTest
    public static void updateRatingTest()
    {

        List<Account> accList = new List<Account>();

       for (Integer i = 0; i < 10; i++) {
           Account acc = new Account();
           acc.Name = 'Hackathon Test '+i;
           acc.Industry = 'Agriculture';
           acclist.add(acc);
       }
      Test.startTest();
       insert accList;
       Test.stopTest();


       List<Account> accToBeUpdated = [SELECT Id, Rating From Account WHERE Id =:accList[0].id ];
       System.assertEquals('Hot',accToBeUpdated[0].Rating);
    }
}