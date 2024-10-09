trigger DriverTrigger on Driver__c (before insert,before delete) {
    if(trigger.isBefore && trigger.isDelete) {
        for(Driver__c driver :trigger.old) {
            if(driver.Related_contact__c != null) {
                driver.Related_contact__c.addError('Cannot delete driver if its link to contact');                
            }
        }
        
    }
}