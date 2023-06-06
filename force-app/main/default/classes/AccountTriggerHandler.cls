public  class AccountTriggerHandler {
    public static void updateDescription(List<Account> accNew, Map<Id,Account> accOldMap) {
        set<id> accIds = new set<id>();
         for (account acc : accNew) {
            if (acc.Description != accOldMap.get(acc.id).Description) {
                accIds.add(acc.id);
            }
         }
         //future metoda bu idleri parametre olarak gonder..
         if (!accIds.isEmpty()) {
            futureDescriptionUpdate(accIds);
         }   
    }
    @future
    public static void futureDescriptionUpdate(set<id> accIds) {
        //Bu accountlara bagli tum contactlari getirip description fieldlerini update ederiz..
        List<Contact> conList = [select id, Description, account.description from contact where accountId =:accIds];
        for (contact con : conList) {
            con.Description = con.Account.Description;
        }
        update conList;
        //Bu accountlara bagli tum opportunityleri getirip description fieldlerini update ederiz..
        List<Opportunity> oppList = [select id, Description, account.description from Opportunity where accountId =:accIds];
        for (Opportunity opp : oppList) {
            opp.Description = opp.Account.Description;
        }
        update oppList;
    }
    @future
    public static void futureCreateContacts(set<id> accIds) {
        List<Contact> conList = new List<Contact>();
        for (id accId : accIds) {
            contact con = new contact();
            con.LastName = 'Contact';
            con.AccountId = accId;
            conList.add(con);
        }
        insert conList;
    }
    /*public static void updateAccDescription(List<Account> accTriggerNew, List<Account> accTriggerOld, Map<Id, Account> accTriggerNewMap, Map<Id,Account> accTriggerOldMap) {
        System.debug('=======');
        for(account eachAcc: accTriggerNew){
            //check if insert, then active is set to YES
            boolean updateDesc = false;
            if(Trigger.isInsert && eachAcc.Active__c == 'Yes'){
                updateDesc = true;
            }
            //check if update
            if(Trigger.isUpdate){
                //check if active field is changed. And new active field is 'Yes'
                    //check if old acc active != new acc active
                if(eachAcc.Active__c != accTriggerOldMap.get(eachAcc.id).Active__c && eachAcc.Active__c == 'Yes'){
                   updateDesc = true;
                }
            }
            if(updateDesc){
                eachAcc.Description = 'Account is now active. Enjoy buddy!';
            }
        }
    }
    public static void updateVIPContacts(List<Account> accTriggerNew, List<Account> accTriggerOld, Map<id, Account> acctriggerNewmap, Map<Id,Account> accTriggerOldmap) {
        set<Id> accIDs = new set<Id>();
        for (Account newAcc : accTriggerNew) {
            if (newAcc.vip__c!= accTriggerOldmap.get(newAcc.Id).vip__c) {
                accIDs.add(newAcc.Id);
            }
        }
        if (!accIDs.isEmpty()) {
        List<Contact> listContacts = [select id, name, vip__c, accountid from Contact WHERE accountid in :accIDs];
        for (Contact eachContact: listContacts) {
            boolean accVIP = acctriggerNewmap.get(eachContact.AccountId).vip__c;
            eachContact.vip__c = accVIP;
        }
        update listContacts;
    }
    }
   
        public static void updateAccountRating(List<Account> accounts) {
            List<Account> accountsToUpdate = new List<Account>();
            
            for (Account acc : accounts) {
                if (acc.Rating == 'HOT') {
                    Integer openOpportunitiesCount = [SELECT COUNT() FROM Opportunity WHERE AccountId = :acc.Id AND IsClosed = false];
                    
                    if (openOpportunitiesCount < 3) {
                        acc.addError('This account CANNOT be HOT.');
                    } else {
                        accountsToUpdate.add(acc);
                    }
                }
            }
            update accountsToUpdate;
        }
        public static void validateDelete(List<Account> accTriggerOld) {
            for (Account oldAcc : accTriggerOld) {
                if (oldAcc.active__c =='Yes') {
                    oldAcc.addError('Can not delete active account!!!');
                    
                }
                
            }
            
        }
        public static void sendRestorationEmail(List<account> accTriggerNew) {
            List<Messaging.SingleEmailMessage> listMessages = new List<Messaging.SingleEmailMessage>();
            for (account newAcc : accTriggerNew) {
    
                List<string> emailAddress = new List<string>();
                emailAddress.add(UserInfo.getUserEmail());
                Messaging.SingleEmailMessage msg = new messaging.SingleEmailMessage();
                msg.setToAddresses(emailAddress);
                msg.setSubject('Account successfully restored: ' + newAcc.name);
                msg.setPlainTextBody('Hello , Account is restored successfully. ');
                listMessages.add(msg);
            }
            Messaging.sendEmail(listMessages);
        }*/

    }

