trigger LeadTrigger on Lead (after insert) {
if (Trigger.isInsert) {
    LeadTriggerHandler.assignment21Task3(Trigger.new);
}
}