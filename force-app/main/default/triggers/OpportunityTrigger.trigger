trigger OpportunityTrigger on Opportunity (before insert, before update, after insert, after update, after delete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            OpportunityTriggerHandler.insertMethod(Trigger.new);
            
        }
        if (Trigger.isUpdate) {
            OpportunityTriggerHandler.updatemethod(Trigger.new, Trigger.oldMap);
            
        }
        if (Trigger.isDelete) {
            OpportunityTriggerHandler.deleteMethod(Trigger.old);
            
        }
        
    }






    /*if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            System.debug('insert before ic ice 2 if..');
        }
    }
    if (Trigger.isInsert&&Trigger.isAfter) {
        System.debug('insert after tek if...');
        
    }*/

    /*if (trigger.isInsert && trigger.isBefore) {
        System.debug('=======before insert trigger tetiklendi.===========');
        System.debug('trigger new = ' + trigger.new);
        for (Opportunity op : trigger.new) {
            System.debug('opportunity name = ' + op.Name);
            System.debug('id = ' + op.id);
            System.debug('created date = ' + op.CreatedDate);
        }
        System.debug('trigger old = ' + trigger.old);
        System.debug('trigger new Map = ' + trigger.newMap);
        System.debug('trigger old Map = ' + trigger.oldMap);
        System.debug('===================================================');
    }
    if (trigger.isInsert && trigger.isAfter) {
        System.debug('=======after insert trigger tetiklendi.===========');
        System.debug('trigger new = ' + trigger.new);
        for (Opportunity op : trigger.new) {
            System.debug('opportunity name = ' + op.Name);
            System.debug('id = ' + op.id);
            System.debug('created date = ' + op.CreatedDate);
        }
        System.debug('trigger old = ' + trigger.old);
        System.debug('trigger new Map = ' + trigger.newMap);
        System.debug('trigger old Map = ' + trigger.oldMap);
        System.debug('===================================================');
    }
    if (trigger.isUpdate && trigger.isBefore) {
        System.debug('=======before update trigger tetiklendi.===========');
        System.debug('trigger new = ' + trigger.new);
        System.debug('trigger old = ' + trigger.old);
        System.debug('trigger new Map = ' + trigger.newMap);
        System.debug('trigger old Map = ' + trigger.oldMap);
        System.debug('===================================================');
    }
    if (trigger.isUpdate && trigger.isAfter) {
        System.debug('=======after update trigger tetiklendi.===========');
        System.debug('trigger new = ' + trigger.new);
        System.debug('trigger old = ' + trigger.old);
        System.debug('trigger new Map = ' + trigger.newMap);
        System.debug('trigger old Map = ' + trigger.oldMap);
        System.debug('===================================================');
    }*/
/*soru: Bir opportunitynin stage Name i update edildiğinde closed lost olarak değiştirildiğinde Description da 'çok üzgünüz' mesajını yazdırsın. closed won olarak değiştirildiğinde 'yaşasın' mesajı yazdırsın. Prospecting olarak değiştirilmek istendiğinde izin verme hata mesajı olarak 'süreci başa döndüremezsiniz..' mesajını ver.*/
/*if (Trigger.isUpdate&&Trigger.isBefore) {
    OpportunityTriggerHandler.stageNameUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
    
}*/
}