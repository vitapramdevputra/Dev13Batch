List<account> listAcc = new list<account>();

Account a = new account();
a.Name = 'test acc';
listAcc.add(a);

Account a2 = new account();
a2.Name = 'test acc';
listAcc.add(a2);

Account a1 = new account();
listAcc.add(a1);

Account a3 = new account();
listAcc.add(a3);

//if we have good and bad data in the same list.
    //normal insert/update dml will do process all records or NONE of the records.
    //if there is error in any one of them, NONE of the records will be inserted.
    //insert listAcc; //0 records will be inserted


    //this works similar to normal insert (ALL OR NONE)
    //Database.insert(listAcc, true);  //0 records will be inserted, this will NOT throw error

//below will insert good guys and will NOT insert bad ones.
List<Database.SaveResult> listResults = Database.insert(listAcc, false); //2 records will be inserted, and other 2 will have errors
for (Database.SaveResult eachResult : listResults) {
    if (eachResult.isSuccess()) {
        system.debug('Record inserted successfully. Record id is ' + eachResult.getId());
    } else{
        system.debug('Record FAILED to insert. Errors : ' + eachResult.getErrors());
    }
}


