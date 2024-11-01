public class UtilFutureDemo {
    @future
    public static void insertUser() {
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User'];
        UserRole r = [SELECT Id FROM UserRole WHERE Name='CEO'];
        User usr = new User(alias = 'hackathon', email='hackathon@hack.com', 
            profileid = p.Id, userroleid = r.Id,
            username='hackathonusertrial@hackathonusertrial.com');
        insert usr;
    }
}