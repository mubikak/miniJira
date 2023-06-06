//trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
  /*if (trigger.isBefore) {
        System.debug('Before insert account trigger');
    }
    if (trigger.isAfter) {
        System.debug('After insert account trigger');
    }
    if (trigger.isInsert) {
        System.debug('Inseert account rtigger');
    }
    if (trigger.isUpdate) {
        System.debug('Update Account trigger');
    }*/
   /*if (trigger.isInsert&& trigger.isBefore) {
        System.debug('Before insert trigger called');
    }
    if (trigger.isInsert&&trigger.isAfter) {
        System.debug('After insert trigger called ');
    }
    if (trigger.isUpdate&& trigger.isBefore) {
        System.debug('Before update trigger called');
    }
    if (trigger.isUpdate&&trigger.isAfter) {
        System.debug('After update trigger called ');
    }
}*/
/*Trigger AccountTrigger on Account(before insert, after insert, before update, after update){
    //List<Account> accTriggerNew = trigger.new; (list)
    List<Account> newAccounts = trigger.new;
    if (Trigger.isBefore&&Trigger.isInsert) {
        System.debug('trigger.new before insert: '+trigger.new);
        System.debug('before insert Number of records : '+newAccounts.size());
        for (Account eachAcc : trigger.new) {
            System.debug('Before acc id '+ eachAcc.Id);
            System.debug('Before acc name '+eachAcc.Name);
        }
    }
    if (Trigger.isAfter&&Trigger.isInsert) {
        System.debug('trigger.new after insert: '+trigger.new);
        System.debug('After insert Number of records : '+newAccounts.size());
        for (Account eachAcc : newAccounts) {
            System.debug('After acc id '+eachAcc.Id);
            System.debug('After acc name '+eachAcc.Name);
        }
    }
}*/
/*trigger AccountTrigger on Account (before insert,after insert, before update,  after update) {

    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('before insert, trigger.old : ' + trigger.old); 
        system.debug('before insert, trigger.new : ' + trigger.new); 
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('after insert trigger.old : ' + trigger.old); 
        system.debug('after insert, trigger.new : ' + trigger.new); 
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('before update trigger.old : ' + trigger.old); 
        system.debug('before update, trigger.new : ' + trigger.new); 
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('after update trigger.old : ' + trigger.old);
        system.debug('after update, trigger.new : ' + trigger.new);  
    }
}*/
/*trigger AccountTrigger on Account (before insert,after insert, before update,  after update) {

    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('after update trigger.old : ' + trigger.old);
        //List<account> oldAccounts = trigger.old;
        for (Account oldAcc : trigger.old) {
            system.debug('old acc id is ' + oldAcc.Id  + ', old acc name is ' + oldAcc.Name);
        }
        system.debug('--');
        system.debug('after update, trigger.new : ' + trigger.new); 
        for (Account newAcc : trigger.new) {
            system.debug('new acc id is ' + newAcc.Id  + ', new acc name is ' + newAcc.Name);
        }
    }
}*/
/*trigger AccountTrigger on Account (before insert,after insert, before update,  after update) {

    system.debug('---');
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('Before insert, trigger.oldMap : ' + trigger.oldMap); 
        system.debug('Before insert, trigger.newMap : ' + trigger.newMap); 
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('After insert trigger.oldMap : ' + trigger.oldMap); 
        system.debug('After insert, trigger.newMap : ' + trigger.newMap); 
    }
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('Before update trigger.oldMap : ' + trigger.oldMap); 
        system.debug('Before update, trigger.newMap : ' + trigger.newMap); 
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('After update trigger.oldMap : ' + trigger.oldMap);
        system.debug('After update, trigger.newMap : ' + trigger.newMap);  
    }
    system.debug('----');
}*/
/*trigger AccountTrigger on Account (before insert,after insert, before update,  after update) {
    List<account> newAccounts = trigger.new;
    Map<id, account> newAccountsMap = trigger.newMap;
    
    system.debug('==================');
    if (Trigger.isBefore && Trigger.isInsert) {
        system.debug('Before insert, trigger.old : ' + trigger.old); 
        system.debug('Before insert, trigger.new : ' + trigger.new); 
        system.debug('Before insert, trigger.oldMap : ' + trigger.oldMap); 
        system.debug('Before insert, trigger.newMap : ' + trigger.newMap); 
    }
    if (Trigger.isAfter && Trigger.isInsert) {
        system.debug('After insert, trigger.old : ' + trigger.old); 
        system.debug('After insert, trigger.new : ' + trigger.new); 
        system.debug('After insert trigger.oldMap : ' + trigger.oldMap); 
        system.debug('After insert, trigger.newMap : ' + trigger.newMap); 
    }

    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('Before update, trigger.old : ' + trigger.old); 
        system.debug('Before update, trigger.new : ' + trigger.new); 
        system.debug('Before update trigger.oldMap : ' + trigger.oldMap); 
        system.debug('Before update, trigger.newMap : ' + trigger.newMap); 
    }
    if (Trigger.isAfter && Trigger.isUpdate) {
        system.debug('After update, trigger.old : ' + trigger.old); 
        system.debug('After update, trigger.new : ' + trigger.new); 
        system.debug('After update trigger.oldMap : ' + trigger.oldMap);
        system.debug('After update, trigger.newMap : ' + trigger.newMap);  
    }
    system.debug('=================');
}*/
/*trigger AccountTrigger on Account (before insert,after insert, before update,  after update) {

    system.debug('=============');

    if (Trigger.isAfter && Trigger.isUpdate) {
        
        for (Id eachId : trigger.newMap.keyset()) {
            
            system.debug('Acc id : ' + eachId);
            Account oldAccount = trigger.oldMap.get(eachId);
            Account newAccount = trigger.newMap.get(eachId);

            system.debug('Old acc name : ' + oldAccount.name + ', New acc name : ' + newAccount.Name);
            system.debug('Old acc rating : ' + oldAccount.rating + ', New acc rating : ' + newAccount.rating);
        }
    }
}*/
/*Trigger AccountTrigger on Account (before insert,after insert, before update,  after update){
    if (Trigger.isAfter&&Trigger.isUpdate) {
        for (Id eachID : trigger.newMap.keySet()) {
            Account oldAcc = trigger.oldMap.get(eachID);
            Account newAcc = trigger.newMap.get(eachID);
            if (oldAcc.Website != newAcc.Website) {
                System.debug('For Account : '+newAcc.Name+ ' Update website is : '+newAcc.Website);
            }
        }
    }
}*/
/*Trigger AccountTrigger on Account( before insert, before update, after insert, after update){
    System.debug('==============');
    if (Trigger.isBefore) {
        for (Account eachAcc : Trigger.new) {
            if(Trigger.isInsert&&eachAcc.Active__c == 'Yes'){
                eachAcc.Description =' Account is now active. Enjoy buddy! ';
            }
            if (Trigger.isUpdate) {
                if (eachAcc.Active__c != Trigger.oldMap.get(eachAcc.Id).Active__c&& eachAcc.Active__c == 'Yes') {
                    eachAcc.Description = ' Account is now active. Enjoy buddy! ';
                }
            }
        }
    }
}*/
/*trigger AccountTrigger on Account (before insert,after insert, before update,  after update) {

    system.debug('---');

    if(Trigger.isBefore){
        //go through each record
        for(account eachAcc: Trigger.new){
            //check if insert, then active is set to YES
            boolean updateDesc = false;
            if(Trigger.isInsert && eachAcc.Active__c == 'Yes'){
                updateDesc = true;
            }
            //check if update
            if(Trigger.isUpdate){
                //check if active field is changed. And new active field is 'Yes'
                    //check if old acc active != new acc active
                if(eachAcc.Active__c != trigger.oldMap.get(eachAcc.id).Active__c && eachAcc.Active__c == 'Yes'){
                   updateDesc = true;
                }
            }
            
            if(updateDesc){
                eachAcc.Description = 'Account is now active. Enjoy buddy!';
            }
        }
    }
}*/
Trigger AccountTrigger on Account (before insert,after insert, before update,  after update) {
    System.debug('=========');
    /*if(Trigger.isBefore ){
        if (Trigger.isInsert || Trigger.isUpdate) {
            AccountTriggerHandler.updateAccDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        }
        if(Trigger.isDelete){
            //call method to validate delete operation
            AccountTriggerHandler.validateDelete(Trigger.Old);
        }
        
    }
    
    if(Trigger.isAfter && Trigger.isUpdate){
        //account after VIP field is update --> update all it's contacts VIP field
        AccountTriggerHandler.updateVIPContacts(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if(Trigger.isAfter && Trigger.isUndelete){
        AccountTriggerHandler.sendRestorationEmail(trigger.new);
    }*/
    if (trigger.isAfter && trigger.isUpdate) {
        AccountTriggerHandler.updateDescription(trigger.new, trigger.oldMap);
        /*set<id> accIds = new set<id>();
         for (account acc : trigger.new) {
            if (acc.Description != trigger.oldMap.get(acc.id).Description) {
                accIds.add(acc.id);
            }
         }
         //future metoda bu idleri parametre olarak gonder..*/
    }

}