@isTEst
public class DmlDemoAgainTest {
    @istest
  
    private static void testInsertStdObj() {
        DmlDemoAgain.dmlInsertDemo_stndObj(); //if this method works correctly, 
        //then we would GET one record in soql
        //
        account acc = [select id, name from account where name = 'softinnovas' limit 1];
        system.assert(acc != null); //we are verifying that acc HAS one account and is NOT null.
        system.assertEquals('softinnovas', acc.Name);
    }

    @isTest
    private static void testInsertCstObj() {
        //call method
        DmlDemoAgain.dmlInsertDemo_cstmObj();

        //soql and assert
        List<Salesforce_Project__c> listSP = [select id, name, project_name__c from Salesforce_Project__c WHERE
        Project_Name__c = 'Learn dml batch 13'];

        system.assertEquals(1, listSP.size());
        assert.areEqual(1, listSP.size());
        
    }
}