//map is keyword to create a map
//1st datatype is of KEY -> country name
//2nd datatype is of VALUE -> currency
Map<string, string> mapCntCurrency = new map<string, string>();
mapCntCurrency.put('USA', 'Dollar');
mapCntCurrency.put('France', 'Euro');
mapCntCurrency.put('Germany', 'Euro');
mapCntCurrency.put('India', 'Rupees'); 
mapCntCurrency.put('India', 'Rupee');//if we have same key. it will overwrite the value.
mapCntCurrency.put('Turkiye', 'Lira');
mapCntCurrency.put('El salvador','Bitcoin');
mapCntCurrency.put('Canada', 'CA Dollar');
mapCntCurrency.put('Canada', 'Canadian Dollar');
system.debug(mapCntCurrency);

//get value (currency for India and Turkiye)
string IndiaCurrency = mapCntCurrency.get('India');
system.debug('India currency is ' + IndiaCurrency);

string TurkiyeCurrency = mapCntCurrency.get('Turkiye');
system.debug('Turkiye currency is ' + TurkiyeCurrency);

set<string> countries = mapCntCurrency.keySet();
system.debug('all countries in the map are ' + countries);

list<string> currencies = mapCntCurrency.values();
system.debug('all currencies ' + currencies);


//--for each loop starts----

set<string> countrySet = mapCntCurrency.keySet();
for(string eachKey: countrySet){
    string printString = 'Country is ' + eachKey;
   
    string eachValue = mapCntCurrency.get(eachKey);
    printString += ', its currency is ' + eachValue;
    system.debug(printString);
    
}