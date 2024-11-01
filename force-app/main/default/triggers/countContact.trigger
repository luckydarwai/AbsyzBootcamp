trigger countContact on Contact (after insert,after update,after delete,after undelete) {

    Set<Id> accIds = new Set<Id>(); // to store parent id of contact

    if (trigger.isAfter && (trigger.isUpdate || trigger.isUndelete)) {
        
        if (!trigger.new.isEmpty()) {
            for (Contact con : trigger.new) {
                 if (con.accountId != null) {
                      accIds.add(con.accountId);
                 }
            }
        }
    }

    if (trigger.isAfter && (trigger.isUpdate)) {
        
        if (!trigger.new.isEmpty()) {
            for (Contact con : trigger.new) {
                if (con.accountId != trigger.oldMap.get(con.Id).accountId) {
                    if (trigger.oldMap.get(con.Id).accountId != null) {
                          accIds.add(trigger.oldMap.get(con.Id).accountId);
                    }
                    if (con.accountId != null) {
                        accIds.add(con.accountId);
                    }
                }
            }
        }
    }
    if (trigger.isAfter && (trigger.isDelete)) {
          if (!trigger.old.isEmpty()) {
             for (Contact con : trigger.old) {
                if (con.accountId != null) {

                    System.debug('Delete : '+con.Name + con.accountId);
                    accIds.add(con.accountId);
                }
                
             }
          }
    }
    System.debug('Set of accIDs : '+accIds                              );

    if (!accIds.isEmpty()) {
        
        List<Account> accList = [Select Id,Number_of_Contacts__c,(Select Id from Contacts) from Account where Id In: accIds];
        List<Account> accToBeUpdated = new List<Account>();

        if (!accList.isEmpty()) {
            for (Account acc : accList) {
                System.debug('acc id : '+acc.Id);
                acc.Number_of_Contacts__c = acc.Contacts.size(); // return current present contacts size.
                System.debug('Number of contacts : '+acc.Number_of_Contacts__c);
                accToBeUpdated.add(Acc);
            }
        }

        if (!accToBeUpdated.isEmpty()) {
            update accToBeUpdated;
        }
    }
}