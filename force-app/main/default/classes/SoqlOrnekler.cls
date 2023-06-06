public  class SoqlOrnekler {
    public static void selectIndustry(string indstry) {
        //List<Account> accList = [select id, name, industry from account   where industry= 'Education'];
        System.debug('=======Select industry metodu calisti.');
        List<Account> accList = [select id, name, industry from account   where industry= :indstry];
        System.debug('Liste : '+accList);
        System.debug('liste : '+accList.size());
        System.debug('==============');
        for (Account acc : accList) {
            System.debug('Account : '+acc);
            
        }
        System.debug('======= b=)  tek tek yazdir');
        for (Account acc : accList) {
            System.debug('Name=> '+acc.Name);
            System.debug('Industry =>'+acc.Industry);  
        }
    }
    public static void childToParent() {
        //Contactlari bagli olduklari accountlarin name ve annualRevenue leri ile beraber getirelim.. annualRevenue bos olanlar gelmesin
        List<Contact> conList = [select id, name, account.name, account.annualRevenue from contact where account.annualRevenue != null];
        System.debug('listemizdeki record sayisi = ' + conList.size());
        for (contact con : conList) {
            System.debug(con.name + ' contactinin bagli oldugu accountun adi = ' + con.account.name + ' ve bu accountun Annual Revenue = ' + con.account.annualRevenue);
            System.debug('========================================================');
        }
    }
    public static void parentToChild() {
        List<Account> accList = [select id, name, createdDate, (select id, name from contacts) from account order by createdDate desc limit 5];
        for (account acc : accList) {
            if (!acc.Contacts.isEmpty()) {

            System.debug('Name = '+acc.name);
            System.debug('Contactlar = '+acc.Contacts);
            System.debug('=============');
            for (Contact con: acc.Contacts) {
                System.debug('contact name : '+con.Name);
                
            }
            }
            System.debug('====opprtunity======');
            System.debug('Account Name: '+acc.Name);
            System.debug('Opportunty = '+acc.Opportunities);
            for (Opportunity opp : acc.Opportunities) {
                System.debug('Opportunty name= '+opp.Name);
                
            }
            
            
        }
    }
}