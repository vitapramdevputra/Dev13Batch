trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        //call handler here.
        SPTriggerHandler.createDefaultTickdt(trigger.new);
    }
}