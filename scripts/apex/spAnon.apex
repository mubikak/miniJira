List<Salesforce_Project__c> listSP = new list<Salesforce_Project__c>();
for (integer i=0; i<5; i++) {
    Salesforce_Project__c sp = new Salesforce_Project__c();
    sp.Project_Name__c = 'Trigger Check'+i;
    sp.Status__c = 'New';
    listSP.add(sp);
}
insert listSP;