trigger LineItemsTrigger on Line_Item__c (after update,after delete,after undelete) {

    // before insert,before update,before delete,after insert, 

    LineItemTriggerHandler.task5(Trigger.new, Trigger.old, Trigger.isInsert, Trigger.isUpdate, Trigger.isDelete, Trigger.isUndelete);


}