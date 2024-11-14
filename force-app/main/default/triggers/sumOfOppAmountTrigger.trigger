trigger sumOfOppAmountTrigger on Opportunity (after insert,after update,after delete,after undelete) {
    
    // Set<Id> accIds = new Set<Id>();
    
    // if (trigger.isAfter && (trigger.isInsert || trigger.isUndelete)) {
    //     if (!trigger.new.isEmpty()) {
    //         for (Opportunity opp : trigger.new) {
    //             if (opp.AccountId != null) {
    //                 accIds.add(opp.AccountId);
    //             }
    //         }
    //     }
    // }
    
    
    
    // if (trigger.isAfter && trigger.isUpdate) {
    //     if (!trigger.new.isEmpty())
    //     {
    //         for (Opportunity opp : trigger.new) {
    //             // if Opportunity Parent is Changed
    //                if (opp.AccountId != trigger.oldMap.get(opp.Id).AccountId) {
    //                 accIds.add(opp.AccountId);
    //                 accIds.add(trigger.oldMap.get(opp.Id).AccountId);
    //                }
    //                else {

    //                 // without changing the parent of opportunity
    //                 accIds.add(opp.AccountId);
    //                }
    //         }
    //     }
    // }

    // if (trigger.isAfter && trigger.isDelete) {
    //     if (!trigger.old.isEmpty()) {
    //        for (Opportunity opp : trigger.old) {
    //            if (opp.accountId != null) {
    //                accIds.add(opp.accountId);
    //            }
    //        }
    //     }
    // }

    // if (!accIds.isEmpty()) {
    //   List<AggregateResult> aggrList = [Select AccountId ids,sum(Amount) totalAmount from Opportunity where AccountId in : accIDs Group By AccountId];
    // Map<Id, Account> accMap = new Map<Id, Account>();
      
    //   if (!aggrList.isEmpty()) {
    //         for (AggregateResult aggr : aggrList) {
    //             Account acc = new Account();
    //             acc.Id =(Id)aggr.get('ids');
    //             acc.Total_Related_Opp_Amount__c = (Decimal)aggr.get('totalAmount');
    //             accMap.put(acc.Id,acc);
    //         } 
    //   }
    //   else{
    //     for (Id accId : accIds) {
    //         Account acc = new Account();
    //         acc.Id =  accId;
    //         acc.Total_Related_Opp_Amount__c = 0;
    //         accMap.put(acc.Id,acc);
    //     }
    //   }


    //   if (!accMap.isEmpty()) {
    //     update accMap.values();
    //   }
    // }


    
}