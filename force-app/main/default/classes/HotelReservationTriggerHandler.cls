public with sharing class HotelReservationTriggerHandler {
    public HotelReservationTriggerHandler() {

    }

    public static void calculateCurrentCapacity (Hotel_Reservation__c[] hotelReservationList) {
        Set<Id> hotelIds = new Set<Id>();

        for (Hotel_Reservation__c hotelReservation: hotelReservationList)
            if(hotelReservation.Hotel__c != NULL)
                hotelIds.add(hotelReservation.Hotel__c);

        List<Hotel__c> hotelsForUpdate = [Select Id, Maximum_Capacity__c, 
                                        (Select Id From Hotel_Reservations__r Where Status__c = 'Reserved') From Hotel__c Where Id IN :hotelIds];

        for (Hotel__c hotelInstance: hotelsForUpdate) {
            if (hotelInstance.Hotel_Reservations__r.size() > hotelInstance.Maximum_Capacity__c){
                hotelReservationList[0].addError('Current capacity can not exceed maximum capacity of a hotel');
                return;
            }
            else
                hotelInstance.Current_Seating_capacity__c = hotelInstance.Hotel_Reservations__r.size();
        }

        Database.update(hotelsForUpdate);
    }
}