trigger createRelatedConTrigger on Account (after insert,after update) {



    // if (trigger.isAfter && (trigger.isInsert || trigger.isUpdate)) {

    // List<Contact> conToBeCreated = new List<Contact>();    
        
    //     if (!trigger.new.isEmpty()) {
            
    //         for (Account acc : trigger.new) {
    //             if (acc.Create_Related_Contact__c==true) {
    //                 Contact con = new Contact();
    //                 con.FirstName = 'Test';
    //                 con.LastName = acc.Name;
    //                 con.Phone = acc.Phone;
    //                 con.AccountId = acc.Id;
    //                 conToBeCreated.add(con);
    //             }                
    //         }
    //     }

    //     if (!conToBeCreated.isEmpty()) {
    //         insert conToBeCreated;
    //     }


    // }
}