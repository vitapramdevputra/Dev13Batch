car bm = new car();
bm.carColor = 'black';
bm.switchOn();
system.debug('bm --> ' + bm);
system.debug('bm car color is -> ' + bm.carColor);

car lm = new car();
lm.carColor = 'red';
lm.switchOn();
//system.debug('lm max speed is ' + lm.maxSpeed);

car vw = new car();
vw.carColor = 'white';
vw.carName = 'polo';
vw.switchOn();
vw.drive();
vw.driveAtMaxSpeed();