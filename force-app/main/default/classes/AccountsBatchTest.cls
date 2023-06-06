@isTest
public  class AccountsBatchTest {
    @isTest
    public static void testBatch1(){
        List<Account> listAcc = new List<Account>();
        for (integer i=0; i<900; i++) {
            Account ac = new Account();
            ac.Name = 'Test AC '+i;
            listAcc.add(ac);
        }
        insert listAcc;
        Test.startTest();
        AccountBatch ab = new AccountBatch();
        Database.executeBatch(ab, 500);
        Test.stopTest();

        List<Account> allAccounts = [select id, description FROM Account];
        for (account eachacc : allAccounts) {
            Assert.isTrue(eachAcc.Description.containsIgnoreCase('Batch'));
        }
    }
}