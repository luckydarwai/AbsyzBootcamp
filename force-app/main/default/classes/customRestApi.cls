@RestResource(urlMapping='/api/Account/*')
global with sharing class customRestApi {
   
    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        // Get the AccountNumber from the request URI
        String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);
        
        // Query the account using AccountNumber
        List<Account> result = [SELECT Id, Name, Phone, Website FROM Account WHERE id = :AccNumber LIMIT 1];
        
        // Check if the result list has any records
        if (result.isEmpty()) {
            // Option 1: Return null if no account is found
            return null;
            
            // Option 2: Throw an exception to indicate no account was found
            // throw new CustomException('No account found for AccountNumber: ' + AccNumber);
        } else {
            // Return the first record if found
            return result[0];
        }
    }
    
    
        @HttpDelete
        global static void doDelete() {
            RestRequest req = RestContext.request;
            RestResponse res = RestContext.response;
            Id AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
            Account result = [SELECT Id, Name, Phone, Website FROM Account WHERE Id = :AccNumber ];
            delete result;
        }
    
        @HttpPost
        global static String doPost(String name,String phone,String AccountNumber ) {
            Account acc = new Account();
            acc.name= name;
            acc.phone=phone;
            acc.AccountNumber =AccountNumber ;
            insert acc;
            
            return acc.id;
        }
    
    
}