public with sharing class customLookupController {
    
    @AuraEnabled(cacheable=true)
    public static List<sObject> searchRecords(String objectApiName,String searchKey)
    {
        List<sObject> sObjectList = new List<sObject>();
        if (String.isNotBlank(searchKey)) {
            String key = '%' + searchKey + '%';
            String queryString = 'Select Id, Name from ' + objectApiName + ' Where Name Like :key';
            sObjectList =  Database.query(queryString,AccessLevel.USER_MODE);
        }
        return sObjectList; 
    }
}