public class ApexCollections {
    public static void main(){
        Map<String, Integer> ageMap = new Map<String, Integer>{
            'Alice' => 30,
            'Bob' => 25,
            'Charlie' => 35
        };
            
      for(String key:ageMap.keySet())  
        {
            System.debug('key : '+key+' Value : '+ageMap.get(key));
        }
    }
    
    
    
    public static void common(){
        
        Set<String> setA = new Set<String>{'Alice', 'Bob', 'Charlie'};
        Set<String> setB = new Set<String>{'Charlie', 'David', 'Eve'};
        
        Set<String> common = new Set<String>();
        for(String st:setA)
        {
            if(setB.contains(st))
            {
                common.add(st);
            }
        }
        
           System.debug('Common Strings : '+common);
        for(String st:common)
        {
            System.debug(' '+st);
        }
            
    }
    
    
    
    
    
    
    
    public static void salaryDetector(){
        Map<String,Decimal> salary=new Map<String,Decimal>{
            'Yogesh'=> 15400,
             'Abhishek'=>15600,
                'Lucky'=> 15500
        };
       Decimal compare= 15500;
       Integer noOfPeople=0;
        
        for(String key:salary.keySet())
        {
            if(salary.get(key)> compare)
            {
                noOfPeople+=1;
            }
        }
        
        System.debug('Number of People : '+noOfPeople);
    }
    
    
    public static void uniqueString()
    {
        List<String> listA = new List<String>{'Alice', 'Bob', 'Charlie'};
        List<String> listB = new List<String>{'Charlie', 'David', 'Eve'};
        List<String> combinedList = new List<String>();
        Set<String> uniqueSet = new Set<String>();
        
        combinedList.addAll(listA);
        combinedList.addAll(listB);
        
        for(String nameA: combinedList)
        {
           if(!listB.contains(nameA))
                  uniqueSet.add(nameA);
        }
        
        System.debug('uniques Names : '+uniqueSet);
     }
    
}