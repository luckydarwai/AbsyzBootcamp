public with sharing class PostTriggerHandler {
   public static void beforeInsert(List<Post__c> newPost)
   {
    List<Post__c> postList = [SELECT Id , LikeS__c , Comments__c , content__c FROM Post__c WHERE Id in :newPost];
    for(Post__c post : postList){
        if(post.Likes__c == post.Comments__c){
            post.content__c = 'Likes and Comments are equal';
            postList.add(post);
        }  
    }
    Update postList;

   }
}