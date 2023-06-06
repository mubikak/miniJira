public  class SF_Assg {
    public static void insertSf() {
        List<Salesforce_Project__c> listSf = new List<Salesforce_Project__c>();
        for (integer i=0 ; i<10; i++) {
            Salesforce_Project__c varSf = new Salesforce_Project__c();
            varSf.Project_Name__c = 'Phone23';
            listSf.add(varSf);
        }
        insert listSf;
    }
    public static void updateSf(){
        List<Salesforce_Project__c> listSF = [select id, Project_Name__c from Salesforce_Project__c WHERE Project_Name__c LIKE '%Phone%' LIMIT 1];
        for (Salesforce_Project__c varSF : listSF) {
            varSF.Project_Name__c = 'Phone2';
        }
        upsert listSF;
    }
}