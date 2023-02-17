public class AccountTriggerHandler {
    //a method which updates description if active is yes
    public static void updateDescription(List<Account> accTriggerNew,
                                        List<account> accTriggerOld,
                                        Map<id, account> accTriggerNewMap,
                                        Map<id, account> accTriggerOldMap) {
        for (Account eachAcc : accTriggerNew) {
            if (Trigger.isInsert && eachAcc.active__c == 'Yes') {
                //update description field
                eachAcc.Description = 'Account is active now. Enjoy buddy!';
            }
            if (Trigger.isUpdate) {
                //check if active field is changed from 'No' or '--None--'' to  'Yes'.
                //how to check if Active field is changed?
                    //oldAccount active field != new Account active field.
                //How to get OldAccount and NewAccount's active field?

                //New account active field as below
                string newActive = eachAcc.Active__c;

                //Old account active field
                    //we use oldMap.get(key)
                Account oldAccount = accTriggerOldMap.get(eachAcc.Id);
                //string oldActive = oldAccount.Active__c;

                //check if active field is changed from 'No' or '--None--'' to  'Yes'.
                if(newActive != oldAccount.Active__c && newActive == 'Yes'){
                    eachAcc.Description = 'Account is active now. Enjoy Enjoy buddy!';
                }
            }
        }
    }

    //new method here
}