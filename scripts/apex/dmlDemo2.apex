undelete [SELECT Id FROM Account WHERE isDeleted = true ALL ROWS];
delete [select id from account where createddate = today limit 50];

DmlDemo2.bulkUpdateRight();
DmlDemo2.bulkInsertRight();
DmlDemo2.insertRelatedRec2();
DmlDemo2.accountUpdate();
list<account> l = new list<account>();
insert l;

string s1;
Boolean b1= string.isBlank(s1);
system.debug('b1 is : '+b1);

string s2 ='';
Boolean b2 = string.isBlank(s2);
system.debug('b2 is : '+b2);