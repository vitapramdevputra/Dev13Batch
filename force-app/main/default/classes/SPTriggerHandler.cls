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
}