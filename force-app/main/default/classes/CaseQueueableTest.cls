@isTest
public class CaseQueueableTest {
    @isTest
   public static void testCases1() {
        list<case> listCase = new list<case>();
        for (Integer i = 0; i < 505; i++) {
            Case c = new case(subject = 'there is a bug', Description = 'resolve it man', Status = 'New', Origin ='Web' );
            listCase.add(c);
        }
        insert listCase;

        Account ac = new account(name = 'Default Test Acc'); 
        insert ac;

        Test.startTest();
        CasesQueueable cq2 = new CasesQueueable(ac.id, listCase); 
        system.enqueueJob(cq2);
        Test.stopTest();
        list<case> allCases = [select id, AccountId from case where accountid != null];
        assert.areEqual(505, allCases.size());
        assert.isTrue(allCases[0].accountId != null);
   }
}