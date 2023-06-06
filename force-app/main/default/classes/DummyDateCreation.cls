public  class DummyDateCreation {
    public static void soql1() {
        List<Opportunity> oppList =[select id, amount, Description from Opportunity where amount != null order by Amount desc limit 10];
        for (Opportunity eachOpp : oppList) {
            eachOpp.Description= 'This is one of the top 10 opportunities.Please work on this properly';
        }
        update oppList;
    }
    public static void soql2(id accId, integer n){
        Account acc = [select id, AnnualRevenue, Name from account where id = : accId];
        list<Opportunity> oppList2 = new List<Opportunity>();
        if(n>0){
                for (Integer i = 1; i <= n; i++) {
                    opportunity opp = new Opportunity();
                    opp.CloseDate= date.today().addYears(3);
                    opp.StageName= 'Prospecting';
                    opp.Amount= acc.AnnualRevenue/n;
                    opp.name= acc.Name + i;
                    opp.AccountId= accId;
                    oppList2.add(opp);
                } 
                system.debug('opportunity list: '+ oppList2);
            insert oppList2; 
        }else{
           system.debug('Please tell us how many opportunities needs to be created'); 
        }
    }
    public static void soql3() {
        List<Account> accList3 = [select name, id from Account where id not IN (SELECT AccountId FROM Contact )];
        List<Contact> nCont = new List<Contact>();
        for (Account eachAcc: accList3) {
            contact newC = new Contact();
            newC.LastName = eachAcc.Name;
            newC.AccountId = eachAcc.Id;
            nCont.add(newC);
        }
        insert nCont;
    }
    public static void delete4 (){
        List<Opportunity> oppList4 =  [SELECT name, id, StageName, amount FROM Opportunity where amount <20000 and stageName ='closed Lost'];
        Delete oppList4;
    }
    public static void soql5(integer n) {
        List<Account> accList5 = new List<Account>();
        for (integer i=1; i<+n; i++) {
            Account acc5 = new Account();
            acc5.Name ='Assignment '+i;
            acc5.Rating = 'Hot';
            acc5.Phone ='12345689';
            acc5.ShippingCity = 'Tampa';
            acc5.ShippingStreet ='Erne';
            acc5.ShippingCountry='USA';
            acc5.BillingStreet ='erne';
            acc5.ShippingCity ='Dunedin';
            acc5.ShippingCountry ='USA';
            accList5.add(acc5);
        }
        insert accList5;
    }
    public static void createNContact(integer n, list<Account> listAcc) {
        List<Contact> listCon = new List<Contact>();
        for (Account eachAcc : listAcc) {
            for (integer i=1; i<=n; i++) {
                Contact con = new Contact();
                con.FirstName ='Mary';
                con.LastName = 'Alaska';
                con.AccountId = eachAcc.Id;
                con.Phone ='123456789';
                con.MailingStreet ='39 erne';
                con.MailingCity ='Dunedin';
                con.OtherCity = 'palm harbor';
                con.OtherStreet = '30 erne';
                listCon.add(con);
            }
        }
        insert listCon;
    }
    public static void createCase(List<Contact> listCon) {
        List<Case> listCase= new List<Case>();
        for (Contact eachCon : listCon) {
            Case cas = new Case();
            cas.ContactId=eachCon.Id;
            cas.AccountId=eachCon.AccountId;
            cas.Subject='Subject';
            cas.Status='Working';
            cas.Origin='Phone';
            listCase.add(cas);
        }
        insert listCase;
    }
}

        
    

    
