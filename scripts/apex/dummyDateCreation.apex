//1.1
DummyDateCreation.soql1();
//1.2
Account acc1 = [SELECT id from Account where name='GenePoint' limit 1];
DummyDateCreation.soql2(acc1.Id, 3);
//1.3
DummyDateCreation.soql3();
//1.4
DummyDateCreation.delete4();
//1.5
DummyDateCreation.soql5(3);
//1.6
List<Account> listAcc= [Select id from Account where createddate=today limit 3];
DummyDateCreation.createNContact(3, listAcc);
//1.7
List<Contact> listCon = [Select id,AccountId from Contact];
DummyDateCreation.createCase(listCon);