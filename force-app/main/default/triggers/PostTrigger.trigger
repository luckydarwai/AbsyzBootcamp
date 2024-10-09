trigger PostTrigger on Post__c (before insert,after update) {

    if (trigger.isBefore && trigger.isInsert) {
        for (Post__c post : trigger.new) {
            String cont = post.Content__c;
            if(cont.length()>30)
            {
                post.addError(' More than 30 char Error ');
            }
            
        }
    }

    if (trigger.isBefore && trigger.isInsert) {
        for (Post__c post : trigger.new) {            
            if(post.Status__c == 'Draft')
            {
                post.addError('You cannot select Status as Draft');
            }
            
        }
    }




    // hands on 
    if (trigger.isBefore && trigger.isInsert) {
        for (Post__c post : trigger.new) {            
            if(post.likes__c > 2)
            {
                if (post.Content__c.length()>=30) {
                    
                    post.addError('You cannot having more than 30 charactor');
                }
            }
            else if(post.likes__c > 3)
            {
                if (post.Content__c.length()>=20) {
                    
                    post.addError('You cannot having more than 20 charactor');
                }
            }
                
            
            
        }
    }



    try {
        if (trigger.isAfter && trigger.isUpdate) {
            for (Post__c post : trigger.new) {
               if (post.likes__c != null && post.Comments__c != null) {
                if (post.likes__c == post.Comments__c) {
                    post.Content__c = 'Likes and Comments are equal';
                }
                update post;
               } 
               
            }
            }

    } catch (Exception e) {
       
    }




   
}