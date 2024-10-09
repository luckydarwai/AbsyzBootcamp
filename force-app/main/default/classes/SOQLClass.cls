public class SOQLClass {

    public static void myMethod()
    {
        List<Account> accList = [Select Name, NumberOfEmployees from account];
        
        
        //For Loop
        for(integer i=0;i<accList.size();i++)
        {
            system.debug(accList[i].numberOfEmployees);
        }
        
        //For Each Loop
        for(Account acc:accList)
        {
            System.debug('************* Acc Name = *****'+acc.Name+'****NumofEmp **** '+acc.numberOfEmployees);
        }
    }
}