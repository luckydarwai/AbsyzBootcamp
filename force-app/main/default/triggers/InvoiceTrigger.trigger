trigger InvoiceTrigger on Invoice__c (before insert,before delete) {

if (trigger.isInsert) {
    InvoiceTriggerHandler.task2(trigger.new);
}
 
if (trigger.isBefore) {
    
    InvoiceTriggerHandler.task3(trigger.old);
}



    
}