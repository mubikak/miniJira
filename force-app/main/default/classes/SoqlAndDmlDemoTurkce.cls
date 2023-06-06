public with sharing  class SoqlAndDmlDemoTurkce {
    public static integer getAccWithOpp() {
        List<Opportunity> firstOpp = [select id,name,AccountId from Opportunity where accountId != null];
    set<Id> accIds = new set<Id>();
    for (Opportunity eachOpp : firstOpp) {
        accIds.add(eachOpp.AccountId);
    }
    List<Account> firstAcc = [select id, name from Account WHERE  id IN: accIds];
    System.debug(firstAcc.size());
    return firstAcc.size();
    }
    public static integer getAccWithOpp2() { 
        
        List<Account> lstAcc = [SELECT id,Name FROM Account Where Id IN (SELECT AccountId FROM Opportunity WHERE AccountId != null ) ];

        System.debug(lstAcc.size());
        return lstAcc.size();
    }
    public static void createAccount(string isim) {
        Account acc = new Account();
        acc.Name = isim;
        insert acc;
        /*Contact con = new Contact();
        con.FirstName = 'Demo';
        con.LastName = 'Contact';
        con.AccountId = acc.Id;
        insert con; */

        List<Contact> firstCon = new List<Contact>();
        for (Integer i= 1; i<= 5 ; i++) {
            Contact con = new Contact();
            con.FirstName = isim;
            con.LastName = 'Contact '+i;
            con.AccountId = acc.Id;
            firstCon.add(con); 
        }
        insert firstCon;
    }
    public static void highestAnnualRevenue() {
        Account acc = [select id, name, AnnualRevenue From Account WHERE AnnualRevenue != null ORDER BY AnnualRevenue DESC LIMIT 1];
        string message = date.today() + ' Tarihi itibariyle '+ acc.Name+ ' accountunun Anual Revenue su '+ acc.AnnualRevenue + ' Tum accountlar icinde en buyuktur ';
        acc.Description = message;
        update acc;
        
    }


    
}


