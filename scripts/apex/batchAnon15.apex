List<Account> accList = [select id, name from account];
for (account acc : accList) {
    if (acc.name.contains('update')) {
        acc.name = acc.name.remove('update');
    }
}
update accList;

BatchApex15 b15 = new BatchApex15();
Database.executeBatch(b15,5);

Queuable15first q15 = new Queuable15first();
system.enqueueJob(q15);
System.enqueueJob(new Queuable15first());

System.enqueueJob(new Queuable15second());

/*DepartmentsBatch db = new DepartmentsBatch();
id JobId = Database.executeBatch(db,5);
system.debug('Job ID is : '+JobId);*/