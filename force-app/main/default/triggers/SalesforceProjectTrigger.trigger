trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update) {

    if (Trigger.isAfter && Trigger.isInsert) {
        //call handler here.
        SPTriggerHandler.createDefaultTickdt(trigger.new);
    }
    if(Trigger.isBefore && Trigger.isUpdate){
        //call method to validate ticket completion.
        SPTriggerHandler.validateProjectCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}