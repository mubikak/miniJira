trigger LeadTrigger on Lead (before insert, before update) {
    List<Lead> leadList = trigger.new;
    if (trigger.isInsert) {
        for (Lead eachLead : leadList) {
            System.debug(eachLead);
        }
    }
    if (trigger.isUpdate) {
        for (Lead eachLead : leadList) {
            System.debug('Lead id : '+eachLead.Id+' Lead Name : '+eachLead.Name+' Lead Description : '+eachLead.Description);
            System.debug('===================');
            
        }
        
    }

}