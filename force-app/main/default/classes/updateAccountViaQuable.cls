public with sharing class updateAccountViaQuable implements Queueable{

    List<Account> accountList;
    public updateAccountViaQuable(List<Account> accountList) {

       this.accountList = accountList;

    }


    public void execute(QueueableContext context) {
        List<Account> accToBeUpdated = new List<Account>();

        if (!accountList.isEmpty()) {
           for (Account acc : accountList) {
               acc.Active_Contact_Count__c = acc.Contacts.size();
           }
        }

        if (!accountList.isEmpty()) {
            update accountList;
        }
    }


}