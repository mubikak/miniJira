// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

/*string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);*/


/*list<contact> l = new list<contact>();

Contact c = new contact();
c.LastName  = 'cnt trigger 3';
l.add(c);

system.debug('----');

Contact c1 = new contact();
c1.LastName  = 'cnt trigger 4';
l.add(c1);

insert l; */

List<account> listAcc = new list<account>();
for (Integer i = 0; i < 5; i++) {
    account ac = new account();
    ac.Name = 'acc trigger bulk ' + i;
    //add account to list
    listAcc.add(ac);
}
insert listAcc;