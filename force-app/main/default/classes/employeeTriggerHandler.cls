public with sharing class employeeTriggerHandler {
    
    
    public static void main(List<Employee__c> empList,Map<Id,Employee__c> oldMap)
    {
        Set<Id> parentIds = new Set<Id>();
        
        if (!empList.isEmpty()) {
            for (Employee__c emp : empList) {
                if(oldMap != null)
                {
                    Employee__c oldEmp = oldMap.get(emp.Id);
                    if (oldEmp.Tech_Firm__c != emp.Tech_Firm__c) {
                        parentIds.add(oldEmp.Tech_Firm__c);
                        parentIds.add(emp.Tech_Firm__c);
                    }
                    else {
                        parentIds.add(emp.Tech_Firm__c);
                    }
                    
                }
                
                else{

                    parentIds.add(emp.Tech_Firm__c);
                }
            }
        }


   

     List<AggregateResult> aggrList = [Select Tech_Firm__c tfId, max(Salary__c) maxSalary, min(Salary__c) minSalary from Employee__c where Tech_Firm__c in : parentIds group by Tech_Firm__c];
    
     Map<Id,Tech_Firm__c> TechFirmToBeUpdated = new Map<Id,Tech_Firm__c>();
     for (Id ids : parentIds) {
        Tech_Firm__c tf = new Tech_Firm__c();
        tf.Id = ids;
        tf.Max_Salary__c = 0;
        tf.Min_Salary__c = 0;
        TechFirmToBeUpdated.put(tf.Id,tf);
    }

     if (!aggrList.isEmpty()) {
        for (AggregateResult aggr  : aggrList) {
            Tech_Firm__c tf = new Tech_Firm__c();
            tf.Id =(Id)aggr.get('tfId');
            tf.Max_Salary__c = (Decimal)aggr.get('maxSalary');
            tf.Min_Salary__c = (Decimal)aggr.get('minSalary');
            TechFirmToBeUpdated.put(tf.Id,tf);

        }
     }

     if(!TechFirmToBeUpdated.isEmpty())
     {
        update TechFirmToBeUpdated.values();
     }
    }
}