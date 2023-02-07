trigger AccountTrigger on Account (before insert, before update, after insert, after update) {
    system.debug('--- trigger start ----');

    if(trigger.isAfter){
        system.debug('after trigger, new data --> ' + trigger.new);
    }

    system.debug('==== trigger end ====');

/*
    if(Trigger.isBefore){
        system.debug('we are in BEFORE trigger.');
        if(Trigger.isInsert){
            system.debug('before insert trigger called.');
        } 
        if(trigger.isUpdate){
            system.debug('before update trigger called.');
        }
    }
    if(Trigger.isAfter){
        system.debug('we are in AFTER trigger. SBNC');
        if(Trigger.isInsert){
            system.debug('after insert trigger called.');
        } 
        if(trigger.isUpdate){
            system.debug('after update trigger called.');
        }
    }
    */
/*
    if(trigger.isBefore && trigger.isInsert){
        system.debug('before insert trigger called.');
    }
    if(trigger.isAfter && trigger.isInsert){
        system.debug('after insert trigger called.');
    }
    if(trigger.isBefore && trigger.isUpdate){
        system.debug('before update trigger called.');
    }
    if(trigger.isAfter && trigger.isUpdate){
        system.debug('after update trigger called.');
    }
    
    
*/

    /*
     // system.debug('-------');
    // system.debug('.isInsert --> ' + trigger.isInsert);
    // system.debug('.isUpdate --> ' + trigger.isUpdate);
    // system.debug('-------');

    system.debug('-------');
    system.debug('.isBefore --> ' + trigger.isBefore);
    system.debug('.isAfter --> ' + trigger.isAfter);
    system.debug('-------');

    if(Trigger.isBefore){
        system.debug('before insert account trigger called.');
    }
    if(Trigger.isAfter){
        system.debug('after insert account trigger called.');
    }
    */
   
}