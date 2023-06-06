public  class CasesQueueable implements Queueable{
    public Id defaultAccId;
    public List<Case> cases;
    public CasesQueueable(){

    }
    public CasesQueueable(Id defaultAccId, List<Case> cases){
        system.debug('Inside Constructor');
        this.defaultAccId = defaultAccId;
        this.cases = cases;
    }
    public void execute(QueueableContext qc){
        system.debug('Inside Execute');
        for(case eachCase : cases){
            eachCase.AccountId = defaultAccId;
        }
        update cases;
    }

}