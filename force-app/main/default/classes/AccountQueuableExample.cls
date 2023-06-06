public class AccountQueuableExample implements queueable {
    list<account> accList;
    public AccountQueuableExample(List<account> accList) {
        this.accList = accList;
    }
    public void execute(QueueableContext qc){
        for (account eachAcc : accList) {
            eachAcc.name+= ' --SI';
        }
        update accList;
    }
}