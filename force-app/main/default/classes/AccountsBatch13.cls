public class AccountsBatch13 implements Database.Batchable<SObject>, database.stateful{
    integer recordCount = 0;
    //start method -> SOQL QUERY -> ACCOUNT -> 50k
    public Database.QueryLocator start(Database.BatchableContext bc){
        system.debug('inside start method.');
        Database.QueryLocator acc = database.getQueryLocator([select id, name, active__c, Description from account]);
        return acc;
    }

    public void execute(Database.BatchableContext bc, list<account> scope){
        system.debug('inside execute method');
        system.debug('check recordCount FIRST: ' + recordCount);
        //update account records
        list<account> updateAccount = new list<account>();
        for (account eachAcc : scope) {
            if (eachacc.Active__c != 'No') {
                eachAcc.Description += '...Updated via batch';
                updateAccount.add(eachAcc);
            }
        }
        if (!updateAccount.isempty()) {
            update updateAccount;
            recordCount += updateAccount.size();
            system.debug('check recordCount SECOND: ' + recordCount);
        }

    }
    //finish method
    public void finish(Database.BatchableContext bc){
        system.debug('finished with all records.');
        system.debug('check recordCount FINAL: ' + recordCount);
        //send email to admins on how many records are processed successfully.
    }
}