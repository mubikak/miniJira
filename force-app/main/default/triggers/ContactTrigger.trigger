//trigger ContactTrigger on Contact (before update, after update, before insert, after insert,before delete, after delete, after undelete) {
    /*if (trigger.isInsert&&trigger.isBefore) {
        System.debug('Before insert trigger called.');
    }
    if (trigger.isInsert&&trigger.isAfter) {
        System.debug('After insert trigger called. ');
    }
    if (trigger.isUpdate&&trigger.isBefore) {
        System.debug('Before update trigger called. ');
    }
    if (trigger.isUpdate&&trigger.isAfter) {
        System.debug('After update trigger called. ');
    }
    if (trigger.isDelete&&trigger.isBefore) {
        System.debug('Before delete trigger called. ');
    }
    if (trigger.isDelete&&trigger.isAfter) {
        System.debug('After delete trigger called. ');
    }
    if (trigger.isUndelete&&trigger.isBefore) {
        System.debug('Before undelete trigger called. ');
        
    }
    if (trigger.isUndelete&&trigger.isAfter) {
        System.debug('After undelete trigger called. ');
    }*/
//}
/*trigger ContactTrigger on Contact(before insert, after insert, before update, after update){
    List<Contact> conTriggernew = trigger.new;
    if (Trigger.isBefore) {
        System.debug('Before trigger called');
        if (Trigger.isInsert) {
            System.debug('Before insert triger called. ');
        }
        if (Trigger.isUpdate) {
            System.debug('Before update trigger called. ');
        }
    }
    if (Trigger.isAfter) {
        System.debug('After trigger called. ');
        if (Trigger.isInsert) {
            System.debug('After insert trigger called.');
        }
        if (Trigger.isUpdate) {
            System.debug('After update trigger called. ');
        }
    }
}*/
/*Trigger ContactTrigger on Contact(before insert, after insert, before update, after update){
    if (Trigger.isBefore&&Trigger.isUpdate) {
        for (Contact eachContact : trigger.new) {
            Contact oldC = Trigger.oldMap.get(eachContact.Id);
            if (oldC.LeadSource== 'Partner Referral ') {
                eachContact.addError('Can not update Contact ');
            }
        }
    }
}*/
/*Trigger ContactTrigger on Contact(before insert, after insert, before update, after update){
    
    if (Trigger.isBefore && Trigger.isUpdate) {
        //Call handler here.
        ContactTriggerHandler.validateContactUpdate1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        ContactTriggerHandler.validateContactUpdate2(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
}
}*/
/*Trigger ContactTrigger on Contact(before insert, after insert, before update, after update){
    if (Trigger.isUpdate&&Trigger.isAfter) {
        ContactTriggerHandler.printLastName(Trigger.new, Trigger.oldMap);
    }
}*/
Trigger ContactTrigger on Contact(before insert, after insert, before update, after update, after undelete, before delete, after delete){
if (Trigger.isAfter) {
    if (Trigger.isInsert) {
        ContactTriggerHandler.insertMethod(Trigger.new);
        if (trigger.isUpdate) {
            ContactTriggerHandler.updateMethod(trigger.new, trigger.oldMap);
          }
          if (trigger.isDelete) {
            ContactTriggerHandler.deleteMethod(trigger.old);
          }
      }
    }
}
