@isTest
public class SoqlDemoTest {

    @TestSetup
    static void makeData(){
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


    }   

    @isTest
    private static void testChildToParent1() {//3 account records here
       
        List<account> listAcc = [select id, name, industry from account];

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

        //we want to reset gov limit before actually calling method
        Test.startTest();
        SoqlDemo.childToParent_SOQL1();
        Test.stopTest();
   }

   @isTest
   private static void testParentToChild() {
    //3 account records here.
        List<account> listAcc = [select id, name, industry from account];
        for (account eachacc : listAcc) {
            eachAcc.type = 'Customer - direct';
        }
        update listAcc;

        List<Opportunity> listOpp = new List<Opportunity>();
        for (Integer i = 0; i < 300; i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'test opp'+i;
            opp.StageName = 'Closed Won';
            opp.CloseDate = date.today();
            
            if (i < 100) {
                opp.AccountId = listAcc[0].id;
            } else if (i < 200){
                opp.AccountId = listAcc[1].id;
            } else {
                opp.AccountId = listAcc[2].id;
            }
            listOpp.add(opp);
        }
        insert listOpp;

        Test.startTest();
        SoqlDemo.parentToChild_SOQL1();
        Test.stopTest();

   }

   @isTest
   private static void testParentToChild2() {
     //prepare data -> 5 sec
     Salesforce_Project__c sp = new Salesforce_Project__c();
     sp.Project_Name__c = 'test sp';

      Salesforce_Project__c sp2 = new Salesforce_Project__c();
     sp2.Project_Name__c = 'test spsp';

     Salesforce_Project__c sp3 = new Salesforce_Project__c();
     sp3.Project_Name__c = 'test sp3';

     List<Salesforce_Project__c> listSP = new List<Salesforce_Project__c>{sp, sp2, sp3};
     insert listSP;

     List<Salesforce_Ticket__c> listST = new list<Salesforce_Ticket__c>();
     for (Integer i = 0; i < 300; i++) {
        Salesforce_Ticket__c st = new Salesforce_Ticket__c();
        st.Subject__c = 'test st' + i;
        st.Priority__c = 'High';
        if (i < 100) {
            st.Salesforce_Project__c = sp.id;
        } else if (i < 200){
            st.Salesforce_Project__c = sp2.id;
        } else {
            st.Salesforce_Project__c = sp3.id;
        }
        listST.add(st);
     }
     insert listST;

     Test.startTest();
     SoqlDemo.parentToChild_SOQL2();
     Test.stopTest();
   }
}