trigger ClientTrigger on client__c (before delete) {
    if(trigger.isBefore && trigger.isDelete) {
        for(Client__c client :trigger.old) {
            if(client.Related_contact__c != null) {
                client.Related_contact__c.addError('Cannot delete client if its link to contact');
                
            }
        }
        
    }
}