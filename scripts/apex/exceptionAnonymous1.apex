try {
    account a = new account();
    a.Name = 'try catch acc';
    insert a;
} catch(DmlException dmlex){
    system.debug('dml went wrong buddy. 😞');
} catch (Exception ex) {
    system.debug('something went wrong buddy');
} finally {
    //this will run if there is any error and code goes to catch.
    //this will run if there is NO error in try.
    system.debug('this will always run. ');
}


system.debug('Apex is SIMPLE');