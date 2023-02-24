trigger CaseTrigger on Case (before insert, before update) {
    system.debug('----START----');
    if(trigger.isBefore){
        system.debug('before insert case trigger called.');
        system.debug('number of records --> ' + trigger.size);
        CaseTriggerHandler.numberOfRecords = CaseTriggerHandler.numberOfRecords + trigger.size;
        CaseTriggerHandler.count++;//count = count + 1;
        system.debug('# of times trigger ran: ' + CaseTriggerHandler.count);
        system.debug('# of record updated: ' + CaseTriggerHandler.numberOfRecords);
    }
    system.debug('----END----');
    
}