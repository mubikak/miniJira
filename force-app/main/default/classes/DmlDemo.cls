public class DmlDemo {
    public static void dmlInsertDemo() {
        Account acc = new Account();
        acc.Website = 'www.salesforce.com';
        insert acc;
        System.debug('Inserted acc '+acc);

    }
    public static void dmlInsertDemo01() {
        Department__c d= new Department__c();
        d.Name__c = 'Human Reseurce';
        d.Short_Code__c = 'HR';
        insert d;
    }
    public static void dmlInsertDemoCO2() {
        //req: create new record in Salesforce Project object

        //1. create new instance.
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Learn DML';
        sp.Status__c = 'New';

        //create record
        //INSERT statement
        insert sp;
   }
   public static void dmlUpdateDemo1() {
    Account acc = new Account();
    acc.Name ='SoftInnovas';
    System.debug('Before insert DML : '+acc);
    insert acc;
    System.debug('After insert DML : '+acc);
    acc.Name ='SoftInnovas INC. ';
    acc.Website = 'www.softinnovas.com';
    update acc;
    System.debug('After update DML : '+acc);
   }
   public static void dmlInsertWrong() {
    Contact c = new Contact();
    c.LastName = 'Devil';
    insert c;
   }
   public static void dmlInsertDemo3(){
    account acc = [select id, name from account order by createddate desc limit 1];

    contact c = new contact();
    c.lastname = 'Biden';
    c.accountid = acc.id; //get id from account record.

    //insert statement
    insert c;
}
}