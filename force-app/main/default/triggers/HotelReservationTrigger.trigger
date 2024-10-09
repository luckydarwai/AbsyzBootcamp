trigger HotelReservationTrigger on Hotel_Reservation__c (after insert,after update, after delete) {


    if (Trigger.isBefore && (Trigger.isInsert || Trigger.isUpdate || Trigger.isDelete)) {
        HotelReservationTriggerHandler.calculateCurrentCapacity(Trigger.new);
    }
}