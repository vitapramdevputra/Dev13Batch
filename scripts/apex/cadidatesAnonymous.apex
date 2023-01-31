Candidates.companyName = 'softinnovas';

system.debug('0. number of candidates : ' + Candidates.countCandidates);

Candidates c1 = new Candidates();
c1.name = 'Jerry';
c1.gender = 'Male';
c1.printCandidate();
system.debug('1. number of candidates : ' + Candidates.countCandidates);

Candidates c2 = new Candidates();
c2.name = 'Elaine';
c2.gender = 'Female';
c2.printCandidate();
system.debug('2. number of candidates : ' + Candidates.countCandidates);

Candidates.companyName = 'Vandeley industries';

Candidates c3 = new Candidates();
c3.name = 'George';
c3.gender = 'Male';
c3.printCandidate();//vandeley
system.debug('3. number of candidates : ' + Candidates.countCandidates);

c1.printCandidate();//
c2.printCandidate();

Candidates.printCompany();

