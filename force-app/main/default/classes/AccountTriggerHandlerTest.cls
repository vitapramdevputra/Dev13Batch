@isTest
public class AccountTriggerHandlerTest {
    
    @isTest
    private static void testUpdateDescription1() {
        Account acc = new account();
        acc.Name = 'SI test';
        acc.Industry = 'Energy';
        acc.Active__c = 'Yes';

        Account acc2 = new account();
        acc2.Name = 'AI test';
        acc2.Industry = 'Energy';
        acc2.Active__c = 'Yes';

        Account acc3 = new account();
        acc3.Name = 'BI test';
        acc3.Industry = 'Banking';
        
        list<account> listAcc = new list<account>{acc, acc2, acc3};
        insert listAcc;

        //assertion only for YES
        list<account> updatedAcc = [select id, description, Active__c from account where Active__c = 'Yes'];
        assert.isTrue(updatedAcc[0].description.contains('Enjoy'));

        //assertion only for both
        list<account> updatedAcc2 = [select id,Active__c, description from account];
        for (account ac : updatedAcc2) {
            if(ac.Active__c == 'Yes'){
                assert.isTrue(ac.description.contains('Enjoy'));
            } else {
                assert.isTrue(ac.Description == null);
            }
        }
       
    }

    @isTest
    private static void testUpdateDescription2() {
        Account acc = new account();
        acc.Name = 'SI test';
        acc.Industry = 'Energy';

        Account acc2 = new account();
        acc2.Name = 'AI test';
        acc2.Industry = 'Energy';

        Account acc3 = new account();
        acc3.Name = 'BI test';
        acc3.Industry = 'Banking';
        
        list<account> listAcc = new list<account>{acc, acc2, acc3};
        insert listAcc;

        //update account records.
        for (Account eachAcc : listAcc) {
            eachAcc.Active__c = 'Yes';
        }
        update listAcc;

        //assertion only for YES
        list<account> updatedAcc = [select id, description, Active__c from account where Active__c = 'Yes'];
        assert.isTrue(updatedAcc[0].description.contains('Enjoy'));
    }

    @istest
    private static void testUpdateVIP1() {
        //create account
        Account acc = new account();
        acc.Name = 'SI test';
        acc.Industry = 'Energy';

        Account acc2 = new account();
        acc2.Name = 'AI test';
        acc2.Industry = 'Energy';

        Account acc3 = new account();
        acc3.Name = 'BI test';
        acc3.Industry = 'Banking';
        
        list<account> listAcc = new list<account>{acc, acc2, acc3};
        insert listAcc;
        //create related contact records
        List<Contact> listContact = new list<contact>();
        for (Integer i = 0; i < 300; i++) {
            contact c = new contact();
            c.LastName = 'anything ' + i;

            if (i < 100) {
                c.accountid = listAcc[0].id;
            } else if(i < 200){
                c.accountid = listAcc[1].id;
            } else {
                c.AccountId = listAcc[2].id;
            }
            listContact.add(c);
        }
        insert listContact;


        //update account's vip field
        test.startTest();
        for (account eachAc : listAcc) {
            eachAc.vip__c = true;
        }
        update listAcc;
        //trigger will be called
            // which will update vip field of all contacts (300).
        Test.stopTest();
        
        
        //what do we have to assert?
        //verify that all contact's VIP field is NOW true(checked).
        list<contact> allContacts = [select id, accountid, vip__c from contact];
        for (contact cc : allcontacts) {
            assert.areEqual(true, cc.vip__c);
        }
        
    }
}