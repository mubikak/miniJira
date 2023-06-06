@isTest
public  class AccountTriggerTest {
    @IsTest
    static void testAccTrg1(){
         List<account> listAcc = new list<account>();
 
         Account acc = new account();
         acc.Name = 'JN Test';
         acc.Industry = 'Energy';
         listAcc.add(acc);
         
         Account acc2 = new account();
         acc2.Name = 'UN Test';
         listAcc.add(acc2);
 
         Account acc3 = new account();
         acc3.Name = 'TN Test';
         listAcc.add(acc3);
 
         insert listAcc;
 
         list<account> list1 = [select id, name from account];
         Assert.areEqual(3, list1.size());
 
         delete acc2;
 
         list<account> list2 = [select id, name from account];
         Assert.areEqual(2, list2.size());
 
         undelete acc2;
         
         list<account> list3 = [select id, name from account];
         Assert.areEqual(3, list3.size());
    }
}