@RestResource(urlMapping='/api/Account/*')
global with sharing class customRestApi {
   
    @HttpGet
    global static Account doGet() {
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        // Get the AccountNumber from the request URI
        String AccNumber = req.requestURI.substring(req.requestURI.lastIndexOf('/') + 1);
        
        List<Account> result = [SELECT Id, Name, Phone, Website FROM Account WHERE id = :AccNumber LIMIT 1];
        
        // Check if the result list has any records
        if (result.isEmpty()) {            
            return null;
        
        } else {
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