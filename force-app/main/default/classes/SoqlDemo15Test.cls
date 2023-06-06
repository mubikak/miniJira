@isTest
public class SoqlDemo15Test {
    @TestSetup
    static void makeData(){
        List<Account> listAcc = new List<Account>();
        for (integer i=0; i<15; i++) {
            Account ac = new Account();
            ac.Name= 'Test Acc'+i;
            ac.Industry= 'Energy';
            listAcc.add(ac);
        }
        insert listAcc;
        List<Opportunity> listOpp= new List<Opportunity>();
        for (integer i=0; i<30; i++) {
            Opportunity opp = new Opportunity(Name= 'Test Opp', StageName='New',CloseDate=date.today(), Amount=50000, AccountId = listAcc[0].Id);
            listOpp.add(opp);
        }
        insert listOpp;
    }
    @isTest
    static void testSoql1(){
        SoqlDemo15.oppAccQuery();
        List<Account> allAcc = new List<Account>();
    }
    @isTest
    static void testSoql2(){
        SoqlDemo15.accContactQuery();
    }
}