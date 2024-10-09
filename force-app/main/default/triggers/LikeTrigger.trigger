*trigger LikeTrigger on Like__c (before insert,after insert) {
// if (trigger.isBefore && trigger.isInsert) {

//     Map<Id, List<Like__c>> postIdWithLikesCountMap = new Map<Id, List<Like__c>>();
//     for (Like__c like_instance : trigger.new) {

//         if (!postIdWithLikesCountMap.isEmpty()) {
//             if (postIdWithLikesCountMap.contains(like_instance.Post__c)) {
//                 postIdWithLikesCountMap.put(like_instance.Post__c,postIdWithLikesCountMap.get(like_instance.Post__c).add(like_instance))
//             }
//             else {
                
//             }
//         }
//         else {
            
//         }
//         if (postIdWithLikesCountMap.contains(like_instance.Post__c)) {
            
//         }
//         else {
//             postIdWithLikesCountMap.put(like_instance.Post__c,new List<Like__c>{like_instance})
//         }
//         postIdWithLikesCountMap.put(like_instance.Post__c,)
//     }
// }


if (trigger.isAfter && trigger.isInsert) {

    List<Post__c> postList = [Select id , Name, Like__c, (Select Id, Name From Like__r) From Post__c];

    for (Post__c post_instance : postList) {
        post_instance.like__c = post_instance.Like__r.size();
    }
    update postList;
    
}

}