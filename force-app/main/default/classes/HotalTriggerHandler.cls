public with sharing class HotalTriggerHandler {
    public HotalTriggerHandler() {

    }
   public static boolean stopRecursion =  false;
    public static void createReservationForActiveContacts(List<Hotel__c> newRecs, List<Hotel__c> oldRecs) {
        try {
            List<Hotel_Reservation__c> reservationsToInsert = new List<Hotel_Reservation__c>();
            for(Hotel__c hotel : newRecs) {
                List<Contact> conList = new List<Contact>();
                if(hotel.Associated_Account__c != null) {
                    conList = [SELECT Id, Name FROM Contact WHERE AccountId = :hotel.Associated_Account__c AND Active__c = true];
                }
                System.debug(conList.size());
                
                for(Contact con : conList) {
                    Hotel_Reservation__c rev = new Hotel_Reservation__c();
                    rev.Name = con.Name + '\'s Reservation';
                    rev.Hotel__c = hotel.Id;
                    rev.Associate_Contact__c = con.Id;
                    rev.Status__c = 'Reserved';
                    reservationsToInsert.add(rev);
                }
            }
            
            if(!reservationsToInsert.isEmpty()) {
                insert reservationsToInsert;
                System.debug(reservationsToInsert.size() + ' reservation created');
            }
        } catch (Exception e) {
            System.debug(e.getMessage());
        }
    }
}