RankHandler rh = new RankHandler();
string p1 = rh.rankPrize(1);
system.debug('p1 is ' + p1);
string p2 = rh.rankPrize(2);
system.debug('p2 is ' + p2);
string p5 = rh.rankPrize(5);
system.debug('p5 is ' + p5);
string p11 = rh.rankPrize(11);
system.debug('p11 is ' + p11);

RankHandler rh2 = new RankHandler();
string ps1 = rh2.rankPrizeSwitch(1);
system.debug('ps1 is ' + ps1);
string ps2 = rh2.rankPrizeSwitch(2);
system.debug('ps2 is ' + ps2);
string ps5 = rh2.rankPrizeSwitch(5);
system.debug('ps5 is ' + ps5);
string ps11 = rh2.rankPrizeSwitch(11);
system.debug('ps11 is ' + ps11);
