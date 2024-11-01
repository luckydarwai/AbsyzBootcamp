public class FirstApexClass {
    
        @InvocableMethod(label = 'Test label')
         public static void printWelcome(){
             Boolean Status;
             Account acc = new Account(Name = 'Lucky Darwai');
             List<Integer> nums = new List<Integer>{1,2,4,5};  
             system.debug('Welcome to Absyz '+nums.get(0));
             system.debug('Welcome to Absyz '+acc.Name);
             }
}