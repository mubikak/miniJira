public  class OpportunityTriggerHandler {
    public static void insertMethod(List<Opportunity> oppTriggerNew) {
        set<id> accIds = new Set<Id>();
        for (Opportunity opp : oppTriggerNew) {
            if (opp.Amount != null && opp.AccountId != null) {
                accIds.add(opp.AccountId);
            }
        }
        if (!accIds.isEmpty()) {
            totalAmount(accIds);
        }
    }
    public static void updateMethod(List<Opportunity> oppTriggerNew, Map<Id,Opportunity> oppTriggerOldMap) {
        Set<Id> accIds = new Set<Id>();
        for (Opportunity opp : oppTriggerNew) {
            Opportunity oldOpp = oppTriggerOldMap.get(opp.Id);
            if (opp.Amount != oldOpp.Amount || opp.AccountId != oldOpp.AccountId) {
                accIds.add(opp.AccountId);
                accIds.add(oldOpp.AccountId);
            }
        }
    }
    public static void deleteMethod(list<opportunity> oppTriggerOld) {
        Set<Id> accIds = new Set<Id>();
        for (Opportunity opp : oppTriggerOld) {
            if (opp.Amount != null && opp.AccountId != null) {
                accIds.add(opp.AccountId);
            }
        }
        if (!accIds.isEmpty()) {
            totalAmount(accIds);
        }
    }
    public static void totalAmount(set<id> accIds) {
        List<Account> accList = [select id, description, (select id, amount from Opportunities where amount != null) from account where id in :accIds];
        for (account acc : accList) {
            List<Opportunity> oppList = acc.Opportunities;
            decimal total = 0;
            for (Opportunity opp : oppList) {
                total += opp.Amount; 
            }
            acc.Description = 'Bu accounta bagli tum oppotunitylerin amountlarinin toplami = ' + total;
        }
        update accList;
    }
}






   /* public static void stageNameUpdate(List<Opportunity> tNew, List<Opportunity> tOld, Map<Id, Opportunity> tNewMap, Map<Id, Opportunity> tOldMap) {
        //trigger new for each icine aliyoruz. her bir recordun stage name kontrolunu yapiyoruz..
        for (Opportunity opp : tNew) {
            if (opp.StageName != tOldMap.get(opp.id).StageName) {
                if (opp.StageName == 'Closed Lost') {
                    opp.Description = 'Cok uzgunuz...';
                }
                if (opp.StageName == 'Closed Won') {
                    opp.Description = 'Yasasin...';
                }
                if (opp.StageName == 'Prospecting') {
                    //opp.addError('Sureci basa donduremezsiniz..');
                    opp.StageName.addError('Sureci basa donduremezsiniz..');
                }
            }
        }
    }*/

    