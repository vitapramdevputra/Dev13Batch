public class Car {
    
    //class variable
    //public means -> accessible outside of the class
    public string carColor = '';
    public string carName;

    //private variable --> accessible ONLY inside of the class
    private integer maxSpeed = 140;

    public void switchOn(){
        datetime switchOnTime = datetime.now();
        system.debug('starting the car nowww.');
    }
    public void drive(){
        
        system.debug('driving ' + carName);
    }
    public void driveAtMaxSpeed(){
        
        string description = 'driving ' + carName + ' of color ' + carColor + ' at ' + maxSpeed + 'km/hr';
        system.debug(description);
    }
   
}
