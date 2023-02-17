public class ContactTriggerHandler {
    public static void contactValidation1(List<contact> conTriggerNew,
                                        List<contact> conTriggerOld,
                                        Map<id, contact> conTriggerNewMap,
                                        Map<id, contact> conTriggerOldMap) {
        //validate if contact's lead source WAS Partner Referral
        for (contact eachContact : conTriggerNew) {
            if (conTriggerOldMap.get(eachContact.Id).LeadSource == 'Partner Referral' ) {
                eachContact.addError('Partner Referral contacts cannot be changed.');
            }
        }
    }
}