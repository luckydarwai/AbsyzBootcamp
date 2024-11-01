public class CustomMetaData {

    
    public static Void countriesPricing(String country)
    {
        Decimal countryPrice;
        
        if(country != null)
        {
            List<CustomMetaData__mdt> cusMetaData = [Select Id, DeveloperName, Counries__c,Pricing__c from CustomMetaData__mdt Where Counries__c =: country limit 1];
            
            if(cusMetaData.size()==1)
            {
                countryPrice = cusMetaData[0].Pricing__c;
            }
        }
        
       System.debug('Country Price is : '+countryPrice);
    }
}