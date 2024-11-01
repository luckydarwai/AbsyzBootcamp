public class Assignment16 {

   //  1. Find the smallest number in a given list.
    public static void task1(){
        List<integer> numbers =new List<integer>{7,8,1,2,4,8,9};
        //Approach 1
        numbers.sort();
        integer smallerNumber = numbers[0];
        System.debug('Smaller Number : '+smallerNumber);        
        
        //Approach 2
        integer smaller=numbers[0];
        for(integer i:numbers){
            if(i<smaller){
                smaller = i;
            }
        }
        System.debug('Smaller Number : '+smaller);
        
    }
    
    
    // 2. Search a key in a given list.
    
    public static void task2(integer key){
        boolean flag=False;
        List<integer> listGiven =new List<integer>{22,11,62,78,87,99,34};
            for(integer i=0;i<listGiven.size();i++){
                if(key==listGiven[i])
                { 
                    flag = True;
                    System.debug('the key '+key+' is present on the index '+i);
                    break;
                }
                else{
                    flag = False;
                }
            }
        if(flag == False)
        {
            System.debug('The Key is not Present in the List');
        }
    }
    
    
    
   // 3. Find the count of strings in the given list.
    public static void task3()
    {
         
    List<Object> mixedList = new List<Object>{'Hello', 123, 'World', true, 'Apex', 456};
        List<String> strList = new List<String>{'Lucky','Abhishek','Yogesh','Lalit'};
        Integer stringCount = 0;

    for (Object item : mixedList) {
    if (item instanceof String) {
         stringCount++;
    }
    }

      System.debug('Count of Strings in the list: ' + stringCount);
        
        
        //Approach 2
       System.debug('Count of string in the given list is : '+strList.size());
    }
    
// 4. Insert 10 accounts(Account Name = Test Account).

    public static void task4()
    {
        List<Account> accToInsert = new List<Account>();
        for(integer i=0;i<10;i++)
        {
            Account acc=new Account(Name='Test New Account');
            accToInsert.add(acc);
        }
      insert accToInsert;  
        
        
        System.debug('Successfully Inserted '+ accToInsert.size() + ' accounts.');
    }
    
   // 5. Query Accounts where name is Test Account ,update Industry Value to Education type value to Installation Partner;.
          
    public static void task5()
    {
        List<Account> accDetails= [select ID, Name from Account Where Name='Test New Account' ];
        List<Account> accListUpdate= new List<Account>();
        if(!accDetails.isEmpty()) {
            for(Account acc:accDetails)
            {
                acc.Industry = 'Education';
                acc.Type = 'Installation Partner';
               // accListUpdate.add(acc);   //best practices
            }
        }
        if(!accDetails.isEmpty()) 
          //  Database.saveResult[] srList = Database.update; //we can get problem also.
        	Database.update(accDetails, false); // rollback is false
           // Database.update(accListUpdate,false);
      
        // Way 2
        // if(!accDetails.isEmpty())
         //    update accDetails;
       
        // fetching the Account Details
        for(Account a:accDetails)
        {
         System.debug('Account Details '+ a.Name + a.Industry );           
        }
    }
    
   // 6. Display the account its related contacts using Map.    
 
    public static void task6()
   {
    List<Account> accounts = [SELECT Id,Name, (SELECT Id, FirstName, LastName, Email FROM Contacts) FROM Account];
       
       
     MAP<Id,List<Contact>> accountContactMap = new Map<Id,List<Contact>>();  
       
       for(Account acc: accounts)
       {
           accountContactMap.put(acc.Id,acc.Contacts);
       }
       
       //Printing       
         for (Id accountId : accountContactMap.keySet()) {           
            List<Contact> contacts = accountContactMap.get(accountId);           
            System.debug('Account Id: ' + accountId);            
            for (Contact con : contacts) {
                System.debug('    Contact Id: ' + con.Id + ', Name: ' + con.FirstName + ' ' + con.LastName + ', Email: ' + con.Email);
            }
        }
   }
    
    //7. Insert Account insert Opportunity Under the same Account.
    
   public static void task7()
   {
     Account newAccount = new Account(Name = 'Test New Account');
     Database.insert(newAccount);
       
     Opportunity newOpp =  new Opportunity(
     Name ='Test Opportunity',
     CloseDate = Date.today()+7, 
     StageName = 'Prospecting',
     AccountId = newAccount.Id    
     );
       
     Database.insert(newOpp); 
   }
    
    // 8. Display Account Related opportunities,contacts using parent child query.
    
    public static void task8()
    {
      List<Account> acc_Opp_Con = [select Id,Name,(SELECT Id, FirstName, LastName, Email FROM Contacts),(select Id, Name, CloseDate, StageName, AccountId FROM Opportunities) from Account];
      for(Account acc: acc_Opp_Con)
      {
          System.debug('Account : '+acc.Name);
          
          //looping Opportunities
          for(Opportunity opp:acc.Opportunities)
          {
               System.debug('    Opportunity: ' + opp.Name + ', Stage: ' + opp.StageName + ', Close Date: ' + opp.CloseDate);
          }
          
          // looping contacts
            for (Contact con : acc.Contacts) {
                System.debug('    Contact: ' + con.FirstName + ' ' + con.LastName + ', Email: ' + con.Email);
            }
      }
    
    }
    
    // always use capital letter in query best practicesss
}