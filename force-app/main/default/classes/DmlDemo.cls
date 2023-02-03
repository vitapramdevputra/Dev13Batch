public class DmlDemo {
    public static void dmlInsertDemo_stndObj() {
        //create instance of sobject
        account acc = new account(); //similar to clicking new button
        //set field names
        acc.Name = 'softinnovas';

        //insert dml to create records
        insert acc;
        system.debug(acc);
    }

    public static void dmlInsertDemo_cstmObj() {
        //create instance
        Salesforce_Project__c sp = new Salesforce_Project__c();
        //set field names
        sp.Project_Name__c = 'Learn dml batch 13';
        sp.Description__c = 'doing good everybody';

        //save it by 'insert dml'
        insert sp;
    }

    public static void dmlupdateDemo_stndObj1() {
        Account ac = new account();
        ac.Name = 'Salesforce';
        system.debug('acc before inserting : ' + ac);
        insert ac;
        system.debug('acc insert called : ' + ac);

        //update any record. WE MUST HVE ID.
        ac.name = 'Salesforce Inc.';
        //update dml
        update ac;
        system.debug('after updating ' + ac);
    }

    public static void dmlUpdateDemo_stndObj3() {
        //1. get record from org
        account acc = [select id, name from account where name = 'softinnovas' limit 1];

        //update name
        acc.Name = 'SoftInnovas Inc.';
        acc.Phone = '9556789451';
        //update dml
        update acc;
    }

    public static void dmlInsertDemo_stndObj2() {
        //fetch account record
        account ac = [select id, name from account where name like 'Softinnovas%' limit 1];
        //create contat instance
        contact c = new contact();
        c.LastName = 'Biden';
        //related field id
        c.AccountId = ac.Id;
        //create contact record
        insert c;
    }
}