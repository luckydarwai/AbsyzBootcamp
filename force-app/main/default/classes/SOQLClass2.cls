public class SOQLClass2 {

    public static void myMethod()
    {
        
        //Comparing Static Value
        List<Contact> conList = [Select firstName, lastName, email from contact where firstName='john'];
        
        String str = 'john';    
        //Comparing Dynamic Value
        List<Contact> conList2 = [select firstName, lastName, email from contact where firstName = :str];
        
    }
    
}