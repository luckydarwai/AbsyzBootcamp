public with sharing class contactBrowserController {
  

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactListByFilter(String accountId,String industry){
      String query = 'Select Id,Name,Title,Email,Phone, PhotoUrl From Contact'; 

      List<String> filters = new List<String>();
      if(String.isNotBlank(accountId))
      {
        filters.add('accountId = :accountId');
      }
      if(String.isNotBlank(industry))
      {
        filters.add('Contact.Account.Industry = :industry');
      }

      if (!filters.isEmpty()) {
        query += ' Where ' + String.join(filters,' AND ');
      }

      query += ' WITH USER_MODE ';
      query += 'ORDER by Name';
      System.debug('query : '+query);
      List<Contact> contactList = Database.query(query);
      return contactList;
    }
}