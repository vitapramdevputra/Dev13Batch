list<case> listcase = new list<case>();
for (Integer i = 0; i < 105; i++) {

    list<case> allCases = [select id, status from case where status = 'New'];
    case c = new case();
    c.Subject = 'trigger case';
    c.Origin = 'Web';
    c.status = 'New';
    c.Description = 'resolve it, come on';
    listCase.add(c);
}
insert listCase;

list<case> allCases = [select id, status from case where status = 'New'];
for (case eachCase : allCases) {
    eachCase.Status = 'Working';
}
update allCases;