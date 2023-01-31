public class SetDemo {
   public static void citySet() {
        set<string> cities = new set<string>();
        cities.add('Tokyo');
        cities.add('Nairobi');
        cities.add('Lisbon');
        cities.add('Berlin');
        cities.add('Tokyo');
        cities.ADD('Nairobi');
        CITIES.add('Berlin');

        System.debug('set of cities ' + cities);
   }

   public static void randomIntegerSet() {
    Set<integer> integerSet = new Set<integer>();
    integerSet.add(10);
    integerSet.add(15);
    integerSet.add(21);
    integerSet.add(15);
    integerSet.add(15);
    system.debug('set of integers ' + integerSet);
   }

   //create a method. Which accepts a list<integer> and it retuns set<integer>
    //if our list has duplicate elements it will be removed.
    public static set<integer> setFromList(list<integer> listInt) {
        //create new empty set.
        Set<Integer> returnSet = new set<integer>();
        //add All the elements of a list using .addAll(list_or_set) method.
        returnSet.addAll(listInt);
        //return the newly created set.
        return returnSet;
    }

    //we are creating a method.
        //which accepts set<string>.
        //return?
            //set<string> by converting each element of the given set to UPPERCASE.
    public static set<string> uppercaseSet(set<string> setStr) {
        //create a temp set in which we will add uppercase elements
        set<string> upprSet = new set<string>();

        system.debug('setStr => ' + setStr);
        //for each loop on setStr(passed in parameter)
        for (string eachStr : setStr) {
            system.debug('each str issss ' + eachStr);
            string tempstr = eachStr.toUpperCase();
            upprSet.add(tempStr);
        }

        return upprSet;
    }
}