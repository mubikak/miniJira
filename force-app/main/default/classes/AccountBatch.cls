public class AccountBatch implements Database.batchable<sobject>, Database.stateful{
    integer countrecords = 0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        System.debug('Batch Started. ');
        Database.QueryLocator acc = database.getQueryLocator([select id, name, description, active__c from account]);
        return acc;
    }
    public void execute(Database.BatchableContext bc, list<account> listAcc){
        System.debug('Execute Method Started. ');
        list<account> updateAcc = new list<account>();
        for (account ac : listAcc) {
            if (ac.active__c != 'No') {
                ac.Description += '..Updated via batch. ';
                updateAcc.add(ac);
            }
        }
        update updateAcc;
        System.debug('Records updated in this Chunk: '+updateAcc.size());
        System.debug('Total Records updated untill now: '+countrecords);
    }
    public void finish(Database.BatchableContext bc){
        system.debug('Batch Processed. ENJOY.');
        System.debug('Total records processed is : '+countrecords);
    }

}