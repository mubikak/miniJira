trigger CaseTrigger on Case (before insert) {
    System.debug('Before insert case trigger. ');
    /*integer recordCount = 0;
    recordCount += Trigger.size;
    System.debug('Number of records processed : '+Trigger.size);*/
    CaseTriggerHandler.recordCount += Trigger.size;
    System.debug('Number of records processed : '+CaseTriggerHandler.recordCount);
    CaseTriggerHandler.triggerCount++;
    System.debug('Number of trigger '+CaseTriggerHandler.triggerCount);

}