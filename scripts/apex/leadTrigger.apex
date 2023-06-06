List<Lead> leadList = new list<Lead>();
for(integer i = 0; i<4; i++){
    Lead l = new Lead();
    l.LastName = 'Akbaba'+i;
    l.Company= 'Akbaba Law';
    l.Status = 'Open-Not Contacted';
    leadList.add(l);
}
insert leadList;
for(Lead eachLead: leadList){
    eachLead.Description= 'Field updated.';
}
update leadList;