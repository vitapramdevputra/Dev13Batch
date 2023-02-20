trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {
    if (Trigger.isBefore && Trigger.isUpdate) {
        //call validation method here.
        //ContactTriggerHandler.contactValidation1(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
        ContactTriggerHandler.contactValidation2(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}