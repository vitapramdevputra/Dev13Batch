Calculator c = new Calculator();
date ddt = date.today();
boolean lpy = c.leapYearCheck(ddt);
system.debug('today date is leap year?? ' + lpy);


integer sum11 = c.add(10, 15, 25);
system.debug('sum11 is ' + sum11);

integer sum1 = c.add(10, 15);
system.debug('sum1 is ' + sum1);
integer x = 15;
integer y = 45;
c.add(x,y); //we are NOT storing return value in a variable.
integer sum2 = c.add(x,y); //we are storing the return value in a variable.



Calculator c1 = new Calculator();
string parameter1 = 'printing this for batch13';
string yes = c1.printAndReturnMessage(parameter1);
system.debug('return message: ' + yes);