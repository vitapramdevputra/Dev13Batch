list<string> listStr = new list<string>();
listStr.add('sounds good');
listStr.add('ok');
listStr.add('method');
listStr.add('clear');
listStr.add('🙌');

string concateStr = '';
//left side -> defining new variable, which we can use inside for loop.
    //new variable(eachStr), will automatically get one by one value from the list.
//right side -> list variable name.
for(string eachStr  : listStr){
    system.debug(eachStr);
    concateStr += ' || ' + eachStr;
    //concateStr = concateStr + ' || ' + eachStr;
}
system.debug(concateStr);