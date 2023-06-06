Account acc = new Account();
acc.Name = 'Account Dml';
acc.AnnualRevenue = 100000;
acc.Industry ='Energy';
insert acc;

Contact con = new Contact();
con.LastName ='Contact Dml';
con.LeadSource = 'web';
insert con;

//parent-child iliski kurma
Account acc2 = [select id from account where name = 'test2' limit 1];
contact con2 = new contact();
con2.LastName = 'Contact Dml 2';
con2.AccountId = acc2.id;
insert con2;

//update
account acc3 = [select id, name from account where name ='test2' limit 1];
acc3.name = 'test2';
update acc3;


Salesforce_Project__c sp = new Salesforce_Project__c();
sp.Project_Name__c = 'Salesforce Project DML';
sp.Status__c ='New';
insert sp;

Salesforce_Ticket__c st = new Salesforce_Ticket__c();
st.Salesforce_Project__c =sp.Id;
st.Subject__c =' Salesforce Ticket Dml';
insert st;


List<Account> accList = [select id, name, AnnualRevenue description from account where AnnualRevenue !=null order by AnnualRevenue desc limit 5];
for (Account acc :accList) {
    acc.Description = date.today() + ' itibariyle bu sirket yillik cirosu en yuksek olan 5 sirketten biri';
}
update accList;

List<Account> accList2 = new List<Account>();
for (Integer i = 1; i <= 5; i++) {
    account acc = new account();
    acc.name = 'Dml Demo Account ' + i;
    accList2.add(acc);
    //insert acc; for dongusu icinde dml yapilmaz..
}
insert accList2;

List<Opportunity> oppList = new List<Opportunity>();
for (account acc : accList2) {
    for (Integer i = 1; i <=5; i++) {
        Opportunity opp = new Opportunity();
        opp.Name = 'Dml Demo Opportunity ' + i;
        opp.CloseDate = date.today().addDays(30);
        opp.StageName = 'Prospecting';
        opp.AccountId = acc.id;
        oppList.add(opp);
    }
}
insert oppList;

    






