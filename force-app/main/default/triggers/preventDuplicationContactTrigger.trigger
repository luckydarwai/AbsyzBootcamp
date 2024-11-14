trigger preventDuplicationContactTrigger on Contact (before insert,before update) {
    
    Map<String, Contact> emailMap = new Map<String, Contact>();
    Map<String, Contact> phoneMap = new Map<String, Contact>();
    
    
    if (trigger.isBefore && trigger.isInsert) {
        
        if (!trigger.new.isEmpty()) {
            for (Contact con  : trigger.new) {
                emailMap.put(con.Email,con);
                phoneMap.put(con.Phone,con);
            }
        }    
        
    }

    if (trigger.isBefore && trigger.isUpdate) {
        if (!trigger.new.isEmpty()) {
             for (Contact con  : trigger.new) {
                if (trigger.oldMap.get(con.Id).Email != con.Email) {
                    emailMap.put(con.Email,con);
                }
                if (trigger.oldMap.get(con.Id).Phone != con.Phone) {
                    emailMap.put(con.Phone,con);
                }
             }
        }
    }

String errorMessage = '';

List<Contact> existingRecords = [Select Id,Email,Phone from Contact where Email in :emailMap.keySet() or phone in:phoneMap.keySet() ];  // Quering from Database in order the compair values are parent in the database . 
    
    if (!existingRecords.isEmpty()) {
        for (Contact con : existingRecords) {
            if (con.Email != null) {
                if (emailMap.get(con.Email) != null) {
                    errorMessage = 'Email';
                }
            }

            if (con.Phone != null) {
                if (phoneMap.get(con.Phone) != null) {
                    errorMessage = errorMessage + (errorMessage != '' ? 'and Phone' : 'Phone');
                }
            }
        }
    }

    if (!trigger.new.isEmpty()) {
        for (Contact con : trigger.new) {
            if (errorMessage != '') {
                con.addError('Your Contact '+ errorMessage + ' already exists in system');
            }
        }
    }
}