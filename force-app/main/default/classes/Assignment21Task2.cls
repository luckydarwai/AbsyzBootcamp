// Assignment 2

// Write a class and schedule it:
// The class should create a new Task (to review the opportunity) for each of the open Opportunity present in the org and assign it to the opportunity owner.
// Schedule the class to execute on every Monday at 9:00 AM.

public class Assignment21Task2 implements Schedulable{
    public void execute(SchedulableContext ctx) {
        List<Opportunity> oppList = [SELECT Id, Name, OwnerId, CloseDate FROM Opportunity WHERE StageName Not In ('Closed Lost','Closed Won')];
        List<Task> taskList = new List<Task>(); 
        try{
            if(oppList != null && oppList.size() > 0) {
              for (Opportunity opp : oppList) {
                Task t = new Task();
                t.WhatId = opp.Id;
                t.WhoId = opp.OwnerId;
                t.Status = 'Not Started';
                t.Subject = 'New Opportunity is Open';
                t.ActivityDate = Date.today();
                taskList.add(t);
              }
              if (!taskList.isEmpty()) {
                insert taskList;
              }
                
            }
        }
            catch(Exception e){
                System.debug('Error occurred while deleting opportunities '+e.getMessage());
            }}
        }