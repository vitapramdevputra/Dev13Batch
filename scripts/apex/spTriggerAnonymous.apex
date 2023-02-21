 List<Salesforce_Project__c> spList = new List<Salesforce_Project__c>();

 Salesforce_Project__c sp = new Salesforce_Project__c();
//set field names
sp.Project_Name__c = 'Learn trigger batch 13';
sp.Description__c = 'doing great everybody';

//save it by 'insert dml'
spList.add(sp);

 Salesforce_Project__c sp2 = new Salesforce_Project__c();
//set field names
sp2.Project_Name__c = 'Learn trigger adv batch 13';
sp2.Description__c = 'doing great everybody';

//save it by 'insert dml'
spList.add(sp2);

insert spList;