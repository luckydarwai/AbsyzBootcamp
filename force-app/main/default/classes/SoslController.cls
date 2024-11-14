public with sharing class SoslController {
    @AuraEnabled(cacheable=true)
    public static List<List<sObject>> getSearchData(String searchText){
        List<List<sObject>> listRecord = [FIND :searchText IN ALL FIELDS RETURNING Account (Id, Name), Contact(Id, Name), Opportunity(Id, Name), Lead(Id, Name), Case(Id, Status)];
        return listRecord;
    }
}