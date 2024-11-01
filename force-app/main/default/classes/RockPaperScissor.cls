public class RockPaperScissor {
  
public static void play(String gameName){

List<Game__c> game_list = [SELECT Id,Name,Player_1__c,Player_2__c,Status__c FROM Game__c WHERE Status__c = NULL 
// AND Player_1__c != NULL AND Player_2__c != NULL
];

for (Game__c i : game_list) {
    
    if (i.Player_1__c=='Rock' && i.Player_2__c=='Rock') 
    {
        i.Status__c='Tie';
        System.debug('Tie');
    }
   else if(i.Player_1__c=='Paper' && i.Player_2__c=='Paper')
    {
        i.Status__c='Tie';
        System.debug('Tie');
    }
    else if(i.Player_1__c=='Scssior' && i.Player_2__c=='Scssior')
    {
        i.Status__c='Tie';
        System.debug('Tie');
    }
    else if(i.Player_1__c=='Rock' && i.Player_2__c=='Paper')
    {
        i.Status__c='Player 2 won';
        System.debug('Player 2 won');
    }
    
    
     else if(i.Player_1__c=='Rock' && i.Player_2__c=='Scssior')
    {
         i.Status__c='Player 1 won';
        System.debug('Player 1 won');
    }
    else if(i.Player_1__c=='Paper' && i.Player_2__c=='Rock')
    {
         i.Status__c='Player 1 won';
        System.debug('Player 1 won');
    }
     else if(i.Player_1__c=='Paper' && i.Player_2__c=='Scissor')
    {
         i.Status__c='Player 2 won';
        System.debug('Player 2 won');
    }
    
       else if(i.Player_1__c=='Scissor' && i.Player_2__c=='Rock')
    {
         i.Status__c='Player 2 won';
        System.debug('Player 2 won');
    }
        else if(i.Player_1__c=='Scissor' && i.Player_2__c=='Paper')
    {
         i.Status__c='Player 1 won';
        System.debug('Player 1 won');
    }
    
    
    update game_list;

    
     
}
}

}