@isTest //this is FOR CLASS
public class CalculatorAgainTest {
    //1. public or private
    //2. static is must
    //3. void mandatory
    //4. NO parameters. None.
    //5. @isTest annotation for test method

    @isTest //THIS IS FOR METHOD
    private static void testMethod1() {
        //we can call a parameterized method of other class.
        CalculatorAgain c = new CalculatorAgain();
        c.welcomeMessage();
        c.printNewMessage('print this from test class');
    }

    @isTest
    private static void testAdd1() {
        CalculatorAgain c = new CalculatorAgain();
        integer sum = c.add(10, 8);
        //asserts, assertion
        system.assertEquals(18, sum);
    }
    @isTest
    private static void testAdd2() {
        CalculatorAgain c = new CalculatorAgain();
        integer sum = c.add(10, 8, 10);
        //asserts, assertion
        system.assertEquals(28, sum);
    }
    @isTest
    private static void testMethod2() {
        CalculatorAgain c = new CalculatorAgain();
        string rt = c.printAndReturnMessage('test it now');
        system.assertEquals('test it now...Ok cool', rt);
    }
}