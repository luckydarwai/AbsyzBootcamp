public with sharing class InvoiceTriggerHandler {

    // 2) Create a trigger, which will append ‘Absyz’ to the names of Invoice records whenever any insertion
    // happens.
      
   public static void task2(List<Invoice__c> inv){

    for (Invoice__c i : inv) {
        
        i.Invoice_Name__c += 'Absyz';
    }
   }


//    3) Create a trigger which will not allow users to delete Invoice records when status is Closed. Use a
// custom error message.

   public static void task3(List<Invoice__c> inv){

    for (Invoice__c i : inv) {
        
        if (i.Status__c == 'Closed') {
            // Prevent deletion by adding an error
            i.addError('You cannot delete an Invoice that is in Closed status.');
        }
    }
   }
}