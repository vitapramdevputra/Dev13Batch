@isTEst
public class AccountBatch13Test {
    @isTest
    public static void testBatch1() {
        //1. Data preparation.
        List<account> listAcc = new list<account>();
        for (Integer i = 0; i < 900; i++) {
            account a = new account();
            a.Name = 'batch test ' + i;
            a.Active__c = 'Yes';
            a.Description = 'TEST. ';
            listAcc.add(a);
        }
        insert listAcc;
        //END OF data preparation;

        //2. execute in between Test.startTest and Test.stopTest.
        Test.startTest();
        AccountsBatch13 ab = new AccountsBatch13();
        Database.executeBatch(ab, 900);
        Test.stopTest();

        //3. assertion
        List<account> allAccounts = [select description from account];
        for (account ac : allaccounts) {
            assert.isTrue(ac.Description.containsIgnoreCase('batch'));
        }
    }
}