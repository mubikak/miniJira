public  class SoqlDemo2 {
    public static void accountContactSoql() {
        List<Contact> listCon =[select id, name, account.name, account.industry, account.annualRevenue, accountid from contact] ;
        decimal totalrev = 0;
        for (contact eachContact : listCon) {
            System.debug('Contact name is: '+eachContact.Name);
            string accName = eachContact.Account.Name;
            System.debug(' Account name is : '+accName+ ' acc industry is '+eachContact.Account.Industry);
            decimal accRevenue = eachContact.Account.AnnualRevenue;
            System.debug(' Account revenue is : '+accRevenue);
            System.debug('========');    
        }
    }
    public static void childToParent2() {
        List<Salesforce_Ticket__c> listST = [select id, name, subject__c, status__c, salesforce_project__c,       salesforce_project__r.status__c, salesforce_project__r.project_name__c from salesforce_ticket__c];
  
        for (Salesforce_Ticket__c eachST : listST) {
              if (eachST.Salesforce_Project__r.Status__c == 'New') {
                  system.debug('Ticket name is ' + eachST.Subject__c + ', its project name is ' + eachST.Salesforce_Project__r.Project_Name__c);
              }
        }
      }
}