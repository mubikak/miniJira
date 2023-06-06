Account ac = new Account(name = 'Default Acc');
insert ac;
List<Case> allCase = [select id, accountid from case where accountid = null];
/*CasesQueueable cq = new CasesQueueable();
cq.cases = allCase;
cq.defaultAccId = ac.Id;*/
CasesQueueable cq2 = new CasesQueueable(ac.Id, allCase);
system.enqueueJob(cq2);