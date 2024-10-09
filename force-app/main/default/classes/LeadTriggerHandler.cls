public class LeadTriggerHandler {
    public static void assignment21Task3(List<Lead> leadList)
    {
        List<Account> accToInsert = new List<Account>();
        List<Contact> conToInsert = new List<Contact>();
        Map<Id, Account> leadToAccountMap = new Map<Id, Account>();

      
        for (Lead lead : leadList) {
            Account acc = new Account();
            acc.Name = lead.Company;
            acc.Industry = lead.Industry;
            acc.BillingStreet = lead.Street;
            acc.BillingCity = lead.City;
            accToInsert.add(acc);
        }   

        if (!accToInsert.isEmpty()) {
            insert accToInsert;

    
            for (Integer i = 0; i < leadList.size(); i++) {

                                    // leadId          // Account
                leadToAccountMap.put(leadList[i].Id, accToInsert[i]);
            }
        }

        for (Lead lead : leadList) {
            if (leadToAccountMap.containsKey(lead.Id)) {
                Account acc = leadToAccountMap.get(lead.Id);
                Contact con = new Contact();
                con.FirstName = lead.FirstName;
                con.LastName = lead.LastName;
                con.MailingStreet = lead.Street;
                con.MailingCity = lead.City;
                con.AccountId = acc.Id;
                conToInsert.add(con);
            }
        }

        if (!conToInsert.isEmpty()) {
            insert conToInsert;
        }
    }
}
