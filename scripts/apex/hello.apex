// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);



// ContactUpdateBatchJob batchJob = new ContactUpdateBatchJob();
// Id batchJobId = Database.executeBatch(batchJob,2);

// System.debug('Total Batch Job : '+batchJob);
// System.debug('Batch Job ID : '+batchJobId);




// CAlling QueableDemoClass from here 
// List<Id> accountIds = new List<Id>();
// for(Account acc : [Select Id from Account WHERE CreatedDate = today]) {
// accountIds.add(acc.Id);
// }

// Id JobId = System.enqueueJob(new QueueableDemoClass(accountIds));



/*

// calling Apex Resp Api
// Simulate a RestRequest and RestResponse
RestRequest req = new RestRequest();
RestResponse res = new RestResponse();

// Set the request URI to simulate an Account Number lookup by REST
req.requestURI = '/api/Account/001dM000025mk4hQAA'; // Replace with a valid AccountNumber or Account ID

// Assign the request and response to RestContext
RestContext.request = req;
RestContext.response = res;

// Call the doGet method (which will internally use the RestContext)
Account result = customRestApi.doGet();

// Check if the result is null before accessing its properties
if (result != null) {
    System.debug('Account Name: ' + result.Name);
    System.debug('Account Phone: ' + result.Phone);
    System.debug('Account Website: ' + result.Website);
} else {
    System.debug('No account found for the given AccountNumber.');
}



*/

 
for (List<Contact> conList : [Select id,Picture__c,Rank__c,Title From Contact limit 10]) {
    for (Contact con : conList) {
        con.Picture__c = 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg';
        if (String.isBlank(con.title)) {
            con.Rank__c =3;
        }
        else{
            con.Rank__c = 8;
        }
    }
    update conList;
}