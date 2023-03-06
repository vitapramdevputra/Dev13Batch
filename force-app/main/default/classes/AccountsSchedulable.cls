public class AccountsSchedulable implements Schedulable{
    public void execute(SchedulableContext sc){
        AccountsBatch13 ab = new AccountsBatch13();
        ID batchId = Database.executeBatch(ab, 21);
    }
}