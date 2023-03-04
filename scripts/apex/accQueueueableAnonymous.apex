list<account> listA = [select id, name from account where name like '%--SI' limit 50];
AccountsQueueable aq = new AccountsQueueable(listA);//will this work?
//we can do enqueueJob only for the classes which IMPLEMENTS queueable.
id qId = system.enqueueJob(aq);

//We can executeBatch only the classes which Implements batchable
//ID batchId = Database.executeBatch(aq, 21);