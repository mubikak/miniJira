List<Case> listcase = new List<Case>();
for (integer i =0; i <205; i++ ) {
    Case c = new Case(Subject = '  There is a bug!! ', Description = ' Resolve it girl!! ', Status = 'New', Origin = 'Web');
    listcase.add(c);
    
}
insert listcase;
CaseTriggerHandler.recordCount = 5;
System.debug(CaseTriggerHandler.recordCount);