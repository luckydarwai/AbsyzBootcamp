trigger HotalTrigger on Hotel__c (after insert) {

if (Trigger.isAfter && Trigger.isInsert) {
    if (HotalTriggerHandler.stopRecursion == false) {
        HotalTriggerHandler.stopRecursion = true;
        HotalTriggerHandler.createReservationForActiveContacts(Trigger.new,Trigger.old);
    }
    
}
}