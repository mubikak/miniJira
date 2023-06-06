public  class SoqlDemo4 {
    public static void groupByQuery() {
        List<aggregateResult> result = [select country__c, count(id), sum(salary__c) from Employee__c group by Country__c];
        for (AggregateResult ar : result) {
            System.debug('Country name is : '+ar.get('country__c'));
            System.debug('Number of employees are : '+ar.get('expr0'));
            System.debug('Total salary is : '+ar.get('expr1'));
        }
    }
    public static void accDynamicSOQL1(string accFieldNames) {
        
        string query = 'select ';
        query = query + accFieldNames;
        query += ' from account';

        system.debug('final query is::  ' + query);
        list<account> listAcc = database.query(query);
        for (account eachAcc : listAcc) {
            system.debug(eachAcc);
        }
    }
    
}