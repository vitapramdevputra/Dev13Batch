public class PrimitiveDataTypeDemo2 {
    public void printNewDate(){
        system.debug('print new dates here.');
        //new date instance             year month day
        Date newDate = Date.newInstance(1995,  02,  15);
        system.debug('new date is ==> ' + newDate);

        Date newDate2 = Date.newInstance(2022,  9,  5);
        system.debug('new date2 is ==> ' + newDate2);

        Date todayDate = Date.today();
        system.debug('today date is ' + todayDate);
    }

    public void printNewTime(){
        //                          hour, min, sec, millisec
        Time myTime = Time.newInstance(18, 15, 10, 50);
        system.debug('my time is --> ' + myTime);

        Time meTime = Time.newInstance(9, 80, 30, 30);
        system.debug('me time is --> ' + meTime);
    }

    public void printNewDateTime(){
        Date newDate = date.today();
        Time newTime = time.newInstance(8, 30, 0, 0);

        //1. new DAtetime using Date and Time
        Datetime dt1 = datetime.newInstance(newDate, newTime);
        system.debug('dt 1 is ==> ' + dt1);

        //2.new Datetime using Year, month, day
        Datetime dt2 = datetime.newInstance(2020, 7, 7);
        system.debug('dt2 is ==> ' + dt2);

        //3. YEAR, MONTH, DAY, HOUR, MINUTE, SECOND
        Datetime dt3 = datetime.newInstance(2022, 1 ,10, 5, 15, 10);
        system.debug('dt3 is ' + dt3);

        //4. milliseconds from 1 Jan 1970 000000 gmt
        long longTime1 = 0;
        Datetime dt4_1 = Datetime.newInstance(longTime1);
        system.debug('dt4_1 ' + dt4_1);

        long longTime2 = 1354987651454L;
        Datetime dt4_2 = Datetime.newInstance(longTime2);
        system.debug('dt4_2 ' + dt4_2);

        //6. current time
        datetime dt6 = datetime.now();
        system.debug('dt6 is ' + dt6);

        //5 newInstanceGMT
        Datetime dt5 = datetime.newInstanceGmt(2021,4,9,15,15,15);
        system.debug('dt5 ' + dt5);

    }
}