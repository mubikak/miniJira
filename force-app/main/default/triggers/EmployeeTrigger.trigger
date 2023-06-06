trigger EmployeeTrigger on Employee__c (before insert, after insert, before update, after update) {
    if (Trigger.isBefore) {
        EmployeeTriggerHandler.updateJoinDate(Trigger.new);
        
    }

}