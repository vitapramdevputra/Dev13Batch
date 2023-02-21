public class AccountTriggerHandler {
    //a method which updates description if active is yes
    public static void updateDescription(List<Account> accTriggerNew,
                                        List<account> accTriggerOld,
                                        Map<id, account> accTriggerNewMap,
                                        Map<id, account> accTriggerOldMap) {
        for (Account eachAcc : accTriggerNew) {
            boolean updateDesc = false;
            if (Trigger.isInsert && eachAcc.active__c == 'Yes') {
                //update description field
                updateDesc = true;
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
                   updateDesc = true;
                }
            }
            if(updateDesc){
                eachAcc.Description = 'Account is active now. Enjoy Enjoy Enjoy buddy!';
            }
        }
    }

    //new method here
    public static void updateVIPForAllContact(List<Account> accTriggerNew,
                                            List<account> accTriggerOld,
                                            Map<id, account> accTriggerNewMap,
                                            Map<id, account> accTriggerOldMap) 
    {
        
        //get account ids where VIP field is CHANGED.
        set<Id> accIds = new set<Id>();
        for (Account eachAcc : accTriggerNew) {
            //get old account using Trigger.Oldmap
            Account oldAccount = accTriggerOldMap.get(eachAcc.id);
            //compare old and new VIP fields. If not equal then add ID in SET
            if (eachAcc.vip__c != oldAccount.vip__c) {
                accIds.add(eachAcc.Id);
            }
        }

        //IF no account's VIP field is changed, then NO need to do any SOQl or any update.
        if(!accIds.isEmpty()){
            //get all contacts of all the account where VIP is changed
            list<contact> getContacts = [select id, vip__c, accountid from Contact where accountId in :accIds];
            for (contact eachContact : getContacts) {
                id accId = eachContact.AccountId;
                //get new account from Trigger.newMap  using .get(key) method
                account newAcc = accTriggerNewMap.get(accId);
                //get VIP field value of new Account
                boolean accVIP = newAcc.vip__c;
                eachContact.vip__c = accVIP;
            }
            if(!getContacts.isEmpty()){
                update getContacts;
            }
        }
    }
}