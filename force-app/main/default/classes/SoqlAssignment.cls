public  class SoqlAssignment {
    public static void contactsAccountRecords() {
        List<Contact> lstcontact = [select id, name, account.id, account.name from contact LIMIT 3];
        for (Contact eachContact : lstcontact) {
            System.debug('Account ID : '+eachContact.Id);
            System.debug('Account name : '+eachContact.Name);
            
        }
    }
    public static void accountsContactRecords() {
        List <Account> lstcontact = [select id, name, (select id, name from contacts) from account LIMIT 3];
        for (Account eachAccount : lstcontact) {
            for (Contact eachContact : eachAccount.Contacts) {
                System.debug('Contact ID : '+ eachContact.Id+ ' Contact Name : '+eachAccount.Name);  
            }
        }
    }
    public static void topEmployees() {
        List<Employee__c> emp = [select id, first_name__c, last_name__c, salary__c from employee__c order by salary__c desc limit 5];
        for (employee__c eachEmp : emp) {
            System.debug('Employee list by salary : '+eachEmp.first_name__c+' '+eachEmp.last_name__c+' '+eachEmp.salary__c);
        }  
    }
    public static void mostPopulatedCountry() {
        aggregateResult countryList = [select count(id), country__c from employee__c group by country__c order by count(id) desc limit 1];
        System.debug('Most populated Country is : '+countryList.get('Country__c'));


        
    }
}