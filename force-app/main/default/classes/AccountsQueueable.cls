public class AccountsQueueable implements Queueable{
    List<account> allAccounts = new list<account>();
    //constructor
    public AccountsQueueable(List<account> accs){
        allAccounts = accs;
    }

    public void execute(QueueableContext qc){
        //update all account's name
        for (account ac : allAccounts) {
            ac.Name += '--SI';
        }
        update allAccounts;
    }
}