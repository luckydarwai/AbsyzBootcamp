trigger duplicateAccTrigger on Account (before insert,before update) {

    // Account Should not be created the account Name is already exists in the database


    Set<String> accNames = new Set<String>();


    if (trigger.isBefore && (trigger.isInsert)) {
        
        if (!trigger.new.isEmpty()) {
            for (Account acc : trigger.new) {
                accNames.add(acc.Name);                
            }
        }


        List<Account> accList =[Select Id, Name from Account where Name in :accNames];

        Map<String, Account> existingAccMap = new Map<String, Account>();

       if (!accList.isEmpty()) {
            for (Account acc : accList) {
                existingAccMap.put(acc.Name,acc);
            }

            if (!trigger.new.isEmpty()){
                for (Account acc : trigger.new) {
                      if (existingAccMap.containsKey(acc.Name)) {
                             acc.addError('Account Name Already Exists');
                      }
                }
            }
       }

    }
}