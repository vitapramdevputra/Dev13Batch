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
}