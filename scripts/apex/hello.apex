// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);



ContactUpdateBatchJob batchJob = new ContactUpdateBatchJob();
Id batchJobId = Database.executeBatch(batchJob,2);

System.debug('Total Batch Job : '+batchJob);
System.debug('Batch Job ID : '+batchJobId);




// CAlling QueableDemoClass from here 
List<Id> accountIds = new List<Id>();
for(Account acc : [Select Id from Account WHERE CreatedDate = today]) {
accountIds.add(acc.Id);
}

Id JobId = System.enqueueJob(new QueueableDemoClass(accountIds));