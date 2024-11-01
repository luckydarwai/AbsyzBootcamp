trigger ExampleTrigger on Contact (before insert) {

     if (Trigger.isInsert) {
        Integer recordCount = Trigger.new.size();
        // Call a utility method from another class
        EmailManager.sendMail('luckydarvai545@gmail.com', 'Send an Email on Contact Creation',
                    recordCount + ' contact(s) were inserted.');
    }
    else if (Trigger.isDelete) {
        // Process after delete
    }
}