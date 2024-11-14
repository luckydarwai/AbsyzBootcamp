trigger employeesTrigger on Employee__c (after insert,after update, after delete, after undelete) {
    if (trigger.isAfter && trigger.isUpdate) {
        employeeTriggerHandler.main(trigger.new,trigger.oldMap);
    }
    else if(trigger.isAfter && trigger.isDelete)
    {
        employeeTriggerHandler.main(trigger.old,null);
    }
    else{
        employeeTriggerHandler.main(trigger.new,null);
    }
}   