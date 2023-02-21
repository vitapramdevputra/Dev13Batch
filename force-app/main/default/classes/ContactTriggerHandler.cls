public class ContactTriggerHandler {
    public static void contactValidation1(List<contact> conTriggerNew,
                                        List<contact> conTriggerOld,
                                        Map<id, contact> conTriggerNewMap,
                                        Map<id, contact> conTriggerOldMap) {
        //validate if contact's lead source WAS Partner Referral
        //one by one contact using for each loop of trigger.new
          //why in trigger.new?
             // addError CAN be done on trigger.new and trigger.newMap ONLY
             // addError NOT POSSIBLE in trigger.old and trigger.oldMap
        for (contact eachContact : conTriggerNew) {
            //check if LeadSource WAS Partner Referral, 
                //so we get the OLD record from oldMap to check leadsource field value
            if ( conTriggerOldMap.get(eachContact.Id).LeadSource == 'Partner Referral' ) {
                // addError CAN be done on trigger.new  and trigger.newMap  ONLY
                eachContact.addError('Partner Referral contacts cannot be changed.');

            }
        }
    }

    public static void contactValidation2(List<contact> conTriggerNew,
    List<contact> conTriggerOld,
    Map<id, contact> conTriggerNewMap,
    Map<id, contact> conTriggerOldMap) {
        
        for (contact eachContact : conTriggerNew) {
            //check if LeadSource is changed.
            if (eachContact.leadsource !=  conTriggerOldMap.get(eachContact.Id).LeadSource ) {
                eachContact.LeadSource.addError('CANNOT CHANGE LEAD SOURCE. PLEASE USER!!!!!!');
            }
        }

    }

    public static void rollUpSummary(List<contact> conTriggerNew,
                                        List<contact> conTriggerOld,
                                        Map<id, contact> conTriggerNewMap,
                                        Map<id, contact> conTriggerOldMap)
    {
        // contact created and account is added ->  increase count of 'numbef of contacts' for that account
        // contact update and account is changed -> increase count of NEW ACCOUNT. 
        //                                       -> Decrease count of OLD Account.
        //contact delete                         -> Decrease count of OLD Account
        //contact is undeleted                   -> Increase count of NEW ACCOUNT
        set<Id> accIds = new set<id>();
        //this if for INCREASE COUNT IDs
        if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
            for(contact eachCon: conTriggerNew){
                if(eachCon.accountId != null){
                    accIds.add(eachCon.AccountId);
                }
            }
        }
        //this if for DECREASE COUNT IDs
        if(Trigger.isDelete || Trigger.isUpdate){
            for(contact eachCon: conTriggerOld){
                if(eachCon.accountId != null){
                    accIds.add(eachCon.AccountId);
                }
            }
        }
        system.debug('account ids ' + accIds);

        List<account> listAccount = [select id, number_of_contacts__c, (select id from contacts) from account 
                                    where id in :accIds];
        for(account eachAcc: listAccount){

            integer numOfContacts = 0;
            if(eachAcc.Contacts != null){
                numOfContacts = eachAcc.Contacts.size();
            }
            //set number of contact's field value to SIZE
            eachAcc.number_of_contacts__c = numOfContacts;
        }
        if(!listAccount.isEmpty()){
            update listAccount;
        }
    }
}