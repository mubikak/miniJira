public class SoqlDemo3 {
    public static void oppAccQuery() {
        List<Opportunity> listOpp = [select id, name, amount, account.name, account.Industry from opportunity where account.Industry = 'energy'];
        for (Opportunity eachOpp : listOpp) {
            System.debug('Opportunity name is : '+eachOpp.Name+ ' , Opportunty amount is : '+eachOpp.Amount);
            System.debug('Account name is : '+eachOpp.Account.Name+ ' , Industry is : '+eachOpp.Account.Industry);
            System.debug('==========================='); 
        }
    }
    public static  void accContactQuery() {
        List<Account> listAcc = [select id, name, website, (select name, email from Contacts) from account];
        for (Account eachAccount : listAcc) {
            System.debug('Each account is : '+eachAccount.Name);
            List<Contact> accContacts = eachAccount.Contacts;
            if (!accContacts.isEmpty()) {
                for (Contact eachContacts : accContacts) {
                    System.debug('contact name : '+eachContacts.Name+ ' Email is : '+eachContacts.Email);
                    
                }
                
            }else {
                System.debug('No contacts found!!');
            }
            System.debug('==========');
            
        }
        
    }
    public static void deptmentDetails() {
        list<Department__c> listDept = [SELECT Name__c, (SELECT first_name__c, last_name__c, country__c, salary__c FROM employees__r) FROM Department__c];

        decimal totalSalary = 0;
        for (department__c eachDept : listDept) {
            system.debug('dept name is ' + eachDept.name__c);
            List<Employee__c> listEmp = eachDept.Employees__r;

            decimal deptSalary = 0;

            for (employee__c eachEmp : listEmp) {
                system.debug('----- Name is ' + eachEmp.First_Name__c + ' ' + eachEmp.Last_Name__c + ', country is ' + eachEmp.Country__c );
                deptSalary += eachEmp.Salary__c;
                totalSalary += eachEmp.Salary__c;
                
            
            system.debug('deptment total salary is ' + deptSalary);
            system.debug('----');
        }
        system.debug('overall total salary is ' + totalSalary);
    }
}
}