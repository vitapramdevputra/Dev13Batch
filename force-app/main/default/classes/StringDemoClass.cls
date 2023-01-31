public class StringDemoClass {
    public void stringMethod1(){
        string sessionDescription = 'learning string methods in apex language';
        system.debug(sessionDescription);

        //1. length
        integer lengthOfStr = sessionDescription.length();
        system.debug('length of session description string: ' + lengthOfStr);

        //2. convert the string to Caps
        string capitalStr = sessionDescription.toUpperCase();
        system.debug('session description in CAPITAL: ' + capitalStr);

        //3. check if our string has 'apex' in it.
        Boolean containsApex = sessionDescription.contains('apex');
        system.debug('contains apex?????? ' + containsApex);

        Boolean containsApex2 = sessionDescription.CONTAINS('Apex');
        system.debug('contains apex 2 ?? => ' + containsApex2);

        Boolean containsApex3 = sessionDescription.containsIgnoreCase('APEX');
        system.debug('contains ignore case APEX? => ' + CONTAINSAPEX3);

        Boolean containsSalesforce = sessionDescription.containsIgnoreCase('salesforce');
        system.debug('contains salesforce? => ' + containsSalesforce);

        string username = '  vitap r   ';
        system.debug('length of username is ' + username.length());
        string username2 = username.trim();
        system.debug('length of username2 is ' + username2.length());
    }
}