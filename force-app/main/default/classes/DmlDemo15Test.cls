@isTest
public  class DmlDemo15Test {
    @isTest
    public static void testDml1(){
        DmlDemo15.dmlInsertDemo1();
        List<Account> listAcc = [select id, name from Account];
        system.assertEquals(1, listAcc.size());
        Assert.areEqual(1, listAcc.size());
        Assert.areEqual('Salesforce', listAcc[0].Name);
    }
    @isTest
    public static void testDML2(){
        DmlDemo15.dmlInsertDemoCO1();
        list<department__c> listdep = [select id, name__c from department__c];
        system.assertEquals(1, listdep.size());
        assert.areequal(1, listdep.size());
        Assert.areEqual('Human Resource', listdep[0].name__c);
    }
    @isTest
    public static void testDml3(){
        Account acc3 = new Account(Name = 'acc test');
        insert acc3;
        DmlDemo15.dmlUpdateDemo2();
        Account accAssert =[select id, name FROM Account WHERE id =: acc3.Id];
        Assert.areEqual('Softinnovas Inc.', accAssert.Name);
    }
    @isTest
    public static void testDML4(){
        Department__c dept = new Department__c(Name__c = 'QA');
        insert dept;
        DmlDemo15.insertRelatedRec2();
        Employee__c emp = [select id, name, first_name__c, last_name__c, Department__c from Employee__c where Department__c = :dept.id limit 1];
        Assert.areEqual('Don', emp.First_Name__c);
    }
    @isTest
    static void testDML5(){
        List<account> listAcc = new list<account>();
        for (Integer i = 0; i < 155; i++) {
            account ac = new account();
            ac.Name = 'test acc ' + i;
            listAcc.add(ac);
        }
        if (!listAcc.isEmpty()) {
            insert listAcc;//insert 155 accounts
        }
        Test.startTest();
        DmlDemo15.bulkUpdateRight();
        Test.stopTest();
        Account acc =[select id, name FROM Account LIMIT 1];
        Assert.isTrue(acc.Name.contains('v2'));
        
    }

    
}