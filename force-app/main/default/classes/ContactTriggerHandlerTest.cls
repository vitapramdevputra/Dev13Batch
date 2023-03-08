@isTest
public class ContactTriggerHandlerTest {
    @isTest
    private static void testUpdateLeadSource1() {
        Contact c1 = new contact();
        c1.LastName = 'test contact';
        c1.LeadSource = 'Web';
        insert c1;

        try {
            c1.LeadSource = 'Phone';
            update c1;
        } catch (Exception ex) {
            system.debug(ex.getMessage());
            //assert that error is field custom validation 
            assert.istrue(ex.getMessage().containsAny('FIELD_CUSTOM_VALIDATION_EXCEPTION'));
        }
        
    }
}