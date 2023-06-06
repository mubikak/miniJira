@isTest
public  class DepartmentTriggerHandlerTest {
    private static void testFuture1() {
        list<Department__c> listDep = new list<Department__c>{
            new Department__c(Name__c = 'Test'),
            new Department__c(Name__c = 'Trigger'),
            new Department__c(name__c = 'Soql'),
            new Department__c(name__c = 'Dml')
        };
        Test.startTest();
        insert listDep;
        Test.stopTest();
        List<Employee__c> listEmp = [select id, first_name__c from employee__c];
        assert.areEqual(4, listEmp.size());
        for (employee__c e : listEmp) {
            system.assertEquals('Richard', e.First_Name__c);
        }

    }
}