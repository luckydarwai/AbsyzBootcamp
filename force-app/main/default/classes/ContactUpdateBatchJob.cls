// Create a batch class to update Contacts:
// Description of Contact should be updated with
// “Title of AccountName : Account’s Description“
// Contact which does not have any Account associated with it, should not be updated
global class ContactUpdateBatchJob implements Database.Batchable<sObject>
{
    // Variable to Store total number of records
    Integer totalRecords = 0;
    Integer totalBatches = 0;
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id,Name,Description,Account.Name,Account.Description FROM Contact WHERE AccountId <> NULL';
        totalRecords = [SELECT COUNT() FROM Contact WHERE AccountId != NULL];
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Contact> conList)
    {
        List<Contact> conToUpdate = new List<Contact>();
        for(Contact con : conList)
        {
            con.Description = con.Account.Name +' : '+con.Account.Description;
            conToUpdate.add(con);
        }
        if (!conToUpdate.isEmpty()) {
            try {
                update conToUpdate;                
            } catch (Exception e) {
                System.debug(e.getMessage());
            }
        }
        // Count the current batch
        totalBatches++;
        System.debug('Processed Batch Number: ' + totalBatches);
    }
    global void finish(Database.BatchableContext BC) {
        
        System.debug('All Batch Processed');
    }
}