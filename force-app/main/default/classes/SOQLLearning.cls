public class SOQLLearning {

    public static void main()
    {
        AggregateResult ar= [Select count(Amount) from Opportunity];
        System.debug(ar);        
        
        AggregateResult ar1= [Select Avg(Amount),sum(Amount) from Opportunity];
        System.debug(ar1);  
        
        
        AggregateResult ar2= [Select Count_Distinct(Amount) from Opportunity];
        System.debug(ar); 
        
        Integer i2 = (Integer)ar2.get('expr0');
        
        System.debug(i2); 
        
    }
    
     public static void keywordSoql()
     {
          // SOQL Keywords 
        List<Account> accList=[Select Name from Account where Name='john' or Name like '%Test%'];
        System.debug('Account List - '+accList);
         
          // IN keyword
        List<String> nameList = new List<String>{'Test Account','Sanjay'};
        List<Account> accList1=[Select Name from Account where Name IN :nameList];
        System.debug('Account List - '+accList1); 
         
          //Not IN keyword
        List<String> nameList1 = new List<String>{'Test Account','Sanjay'};
        List<Contact> accList2=[Select firstName from Contact where Name Not IN :nameList1];
        System.debug('Account List - '+accList1); 
         
         
         // Like Keyword
        List<Account> acc = [Select Name from Account where Name like 'GanePoint'];
         
         //WildCards 1. %(percentage)=> o or multiple characters
         //          2. _(Underscore) => Single Character
         //          
         List<Account> acc1 = [Select Name from Account where Name like '%GanePoint%'];
         List<Account> acc2 = [Select Name from Account where Name like '_GanePoint']; 
        
         // oreder by 
         List<Opportunity> accDet = [Select Name,Amount from Opportunity Order By Amount NULLS LAST];
         System.debug('accDet : '+accDet);
     }
}