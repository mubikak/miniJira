trigger DepartmentTrigger on Department__c (before insert, after insert) {
    if (Trigger.isAfter&&Trigger.isInsert) {
        DepartmentTriggerHandler.createDefaultEmployee(Trigger.newMap.keySet());
        
    }

}