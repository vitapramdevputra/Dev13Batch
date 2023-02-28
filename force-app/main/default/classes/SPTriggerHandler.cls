public class SPTriggerHandler {
   public static void createDefaultTickdt(list<salesforce_project__c> spTriggerNew) {
        List<Salesforce_Ticket__c> newTickets = new List<Salesforce_Ticket__c>();
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            //create new ticket here
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = 'Default ST';
            st.Salesforce_Project__c = eachSP.id;
            st.Requested_by_date__c = date.today();
            newTickets.add(st);
        }
        if (!newTickets.isEmpty()) {
            insert newTickets;
        }
   }

   public static void validateProjectCompletion(List<Salesforce_Project__c> spTriggerNew, 
    List<Salesforce_Project__c> spTriggerOld, Map<id, Salesforce_Project__c> spTriggerNewMap, 
    Map<id, Salesforce_Project__c> spTriggerOldMap){

        set<id> spCompleteIds = new set<id>();
        //get all SP ids for which Status is changed to completed
        for(Salesforce_Project__c eachSP: spTriggerNew){
            if(eachSP.Status__c != spTriggerOldMap.get(eachSP.id).Status__c
            && eachSP.Status__c == 'Completed'){
                spCompleteIds.add(eachSP.Id);
            }
        }
        system.debug('sp completed ids  are ' + spCompleteIds);

        if(!spCompleteIds.isEmpty()){
            //get 'not completed' tickets for completed projects.
            //if we find any not completed ticket for completed project, then THROW ERROR.
            List<Salesforce_Ticket__c> listST = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c
                                                    WHERE Salesforce_Project__c in :spCompleteIds 
                                                    and status__c != 'Completed'];
            for(Salesforce_Ticket__c eachST: listST){
                //get project from Trigger.newMap context variable to throw error
                Salesforce_Project__c newSP = spTriggerNewMap.get(eachST.Salesforce_Project__c);
                newSP.Status__c.addError('Cannot complete project because all its tickets are not completed');
            }
        }
        
   }

   @future
   public static void updateProjectDescription(set<id> spIds) {
    if (!spIds.isEmpty()) {
        List<Salesforce_Project__c> listSP = [select id, description__c from Salesforce_Project__c where id in :spIds];
        for (Salesforce_Project__c eachSP : listSP) {
            eachSP.Description__c = 'Updated  desc from future method';
        }
        update listSP;
    }
   }
}