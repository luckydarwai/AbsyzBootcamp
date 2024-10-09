trigger HotelReservationTrigger on Hotel_Reservation__c (after insert,after update, after delete,before insert,before update, before delete) {


    if (Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)) {
        HotelReservationTriggerHandler.calculateCurrentCapacity(Trigger.new);
    }
    if (Trigger.isAfter && (Trigger.isDelete)) {
        HotelReservationTriggerHandler.calculateCurrentCapacity(Trigger.old);
    }
}