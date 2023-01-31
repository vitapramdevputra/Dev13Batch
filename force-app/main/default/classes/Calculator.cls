public class Calculator {

   public void welcomeMessage(){
        system.debug('welcome to apex calc');
        printNewMessage('welcome welcome');
   }

   public void printNewMessage(string msg){
        system.debug(msg);
   }

   void privatePrintMessage(string msg){
     system.debug('inside private method NOOWW');
     system.debug(msg);
     system.debug('done with private');
   }

   public string printAndReturnMessage(string m){
          privatePrintMessage(m); 
          string returnStr = '';
          returnStr = m + '...Ok cool';
          return returnStr;
   }
   public integer add(integer a, integer b){
     integer sum = a + b;
     return sum;
   }
   public integer add(integer x, integer y, integer z){
     integer sum = x+y+z;
     return sum;
   }

   public boolean leapYearCheck(date dt){
     //using date we get year component
     integer year = dt.year();
     //using year, we can check leap year using isLeapYear method
     boolean lp = date.isLeapYear(year);
     return lp;
   }

}