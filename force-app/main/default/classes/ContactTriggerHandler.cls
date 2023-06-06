public  class ContactTriggerHandler{
    public static void insertMethod(List<Contact> conTriggerNew) {
        Set<Id> accIds = new Set<Id>();
        for (Contact con : conTriggerNew) {
           if (con.AccountId != null) {
               accIds.add(con.AccountId);
           }
        }
        if (!accIds.isEmpty()) {
           numberOfContacts(accIds);
        }
      }
      public static void updateMethod(List<Contact> conTriggerNew, Map<Id,Contact> conTriggerOldMap) {
          Set<Id> accIds = new Set<Id>();
          for (Contact con : conTriggerNew) {
              contact oldCon = conTriggerOldMap.get(con.id);
              if (con.AccountId != oldCon.AccountId) {
                 accIds.add(con.AccountId);
                 accIds.add(oldCon.AccountId);
              }
          }
          if (!accIds.isEmpty()) {
           numberOfContacts(accIds);
          }
      }
      public static void deleteMethod(List<Contact> conTriggerOld) {
          Set<Id> accIds = new Set<Id>();
          for (Contact con : conTriggerOld) {
             if (con.AccountId != null) {
                 accIds.add(con.AccountId);
             }
          }
          if (!accIds.isEmpty()) {
           numberOfContacts(accIds);
          }
      }
      public static void numberOfContacts(Set<Id> accIds) {
         List<Account> accList = [select id, Number_of_Contacts__c, (select id from contacts) from account where id in : accIds];
         for (Account acc : accList) {
           List<Contact> conList = acc.Contacts;
           acc.Number_of_Contacts__c = conList.size();
         }
         update accList;
      }
}
    /*public static void validateContactUpdate1(List<Contact> cTriggerNew, List<Contact> cTriggerOld, 
    Map<id, Contact> cTriggerNewMap, Map<id, Contact> ctriggerOldMap) {
        for (Contact newContact : cTriggerNew) {
            Contact oldContact = ctriggerOldMap.get(newContact.Id);
            if (oldContact.LeadSource == 'Partner Referral') {
                newContact.addError(' Can not update Conract with lead source as Partner Referral. ');
            }
        }
    }
    public static void validateContactUpdate2(
    List<Contact> cTriggerNew, 
    List<Contact> cTriggerOld, 
    Map<id, Contact> cTriggerNewMap, 
    Map<id, Contact> ctriggerOldMap) {
        for (Contact newContact : cTriggerNew) {
            if (newContact.LeadSource != ctriggerOldMap.get(newContact.Id).LeadSource) {
                newContact.LeadSource.addError('Can not update leadsource. Please user! Go away :))  ');
            }
        }
}*/
/*public static void printLastName(List<Contact> cTriggerNew, map<id, Contact> cTriggerOldmap) {
    for (Contact con : cTriggerNew) {
        System.debug('Yeni last name = '+con.LastName+ ' - '+' eski Last Name = '+cTriggerOldmap.get(con.Id).LastName);
    }
}*/

