trigger AccountTrigger2 on Account (before delete, after delete) {

        if (Trigger.isBefore) {
            system.debug('Before delete trigger.new : ' + trigger.new);
        }
        if (Trigger.isAfter) {
            system.debug('After delete trigger.new : ' + trigger.new);
        }
        
    }

    
    

