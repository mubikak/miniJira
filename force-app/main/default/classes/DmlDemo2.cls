public  class DmlDemo2 {
    public static void insertRelatedRec2() {
        Department__c d = [select id from Department__c order by CreatedDate desc limit 1];
        Employee__c e = new Employee__c();
        e.First_Name__c = 'Don';
        e.Last_Name__c = 'Eladio';
        e.Salary__c = 500000;
        e.Department__c = d.id;
        e.Country__c ='Mexico';
        insert e;
        System.debug('empt is : '+e);
    }
    public static void bulkInsertRight() {
        List<Account> listAcc = new List<Account>();
        for (Integer i=0; i< 155; i++) {
            Account ac = new Account();
            ac.Name = 'Test acc '+i;
            listAcc.add(ac);
        }
        if (!listAcc.isEmpty()) {
            insert listAcc;
        }
    }
    public static void bulkUpdateRight() {
        List<Account> listAcc = [select id, name from Account where CreatedDate= TODAY];
        for (Account eachAcc : listAcc) {
            eachAcc.Name = eachAcc.Name+'v2'; 
        }
        update listAcc;
    }
    public static void accountUpdate() {
        List<Account> allAccounts = [select id, name, description, active__c from Account];
        List<Account> updateAccList = new List<Account>();
        for (Account eachAcc : allAccounts) {
            if (eachAcc.active__c == 'No' || string.isBlank(eachAcc.Active__c) ) {
                eachAcc.Description = 'inactive';
                updateAccList.add(eachAcc);
            }
        }
        update updateAccList;
    }
    
}