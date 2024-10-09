// When a new Lead is inserted,
// Create an account with Name, Industry and BillingAddress same as Lead’s Company, Industry and Address.
// Create a Contact with FirstName, LastName, Account same as Lead’s FirstName, LastName and Account’s Name respectively.

public class LeadTriggerHandler {
    public static void assignment21Task3(List<Lead> leadList)
    {
        List<Account> accToInsert = new List<Account>();
        List<Contact> conToInsert = new List<Contact>();
        for (Lead lead : leadList) {
            Account acc = new Account();
            acc.Name = lead.Company;
            acc.Industry = lead.Industry;
            acc.BillingStreet = lead.Street;
            acc.BillingCity = lead.City;
            accToInsert.add(acc);
            
            Contact con = new Contact();
            con.FirstName = lead.FirstName;
            con.LastName = lead.LastName;
            con.MailingStreet = lead.Street;
            con.MailingCity = lead.City;
            con.AccountId = acc.Id;
            conToInsert.add(con);
        }
        
        if (!accToInsert.isEmpty()) {
            insert accToInsert;
        }
        if (!conToInsert.isEmpty()) {
            insert conToInsert;
        }
    }
}