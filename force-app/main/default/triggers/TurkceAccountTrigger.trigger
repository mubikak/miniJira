trigger TurkceAccountTrigger on Account (before insert,before update, after insert, after update) {
    if (trigger.isInsert && trigger.isAfter) {
        List<contact> conList = new List<Contact>();
          for (account acc : trigger.new) {
             for (Integer i = 1; i <=7; i++) {
                contact c = new contact();
                c.FirstName = acc.name;
                c.LastName = 'Contact ' + i;
                c.AccountId = acc.id;
                conList.add(c);
             }
          }
          if (!conList.isEmpty()) {
            insert conList;  
          }  
       }  
        // 2. Bir account update edildiğinde name değişmişse description fieldine name değişti mesajı yazdır..
        if (trigger.isUpdate && trigger.isBefore) {
            // yeni name ve eski name yazdiralim..
            for (account acc : trigger.new) {
                string newName = acc.Name;
                string oldName = trigger.oldMap.get(acc.id).Name;
                System.debug('account new name = ' + newName);
                System.debug('account old name = ' + oldName);
                if (newName != oldName) {
                    acc.Description = 'Bu recordun ismi degisti..';
                }
            }
        }
}