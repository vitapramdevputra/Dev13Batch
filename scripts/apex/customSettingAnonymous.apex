Map<string, country_code__c> mapCountryCode = country_code__c.getAll();
system.debug(mapCountryCode);

//print 'Country name is United States its code is USA'

for (string eachName : mapCountryCode.keySet()) {
    country_code__c c = mapCountryCode.get(eachName);
    system.debug('Country name is ' + eachName + ' its code is ' + c.code__c);
}

Country_code__c c1 = country_code__c.getInstance('India');
system.debug('c1 code is ' + c1.code__c);

//OLD OPTION.
list<country_code__c> allCC = [select id, name, code__c from country_code__c];