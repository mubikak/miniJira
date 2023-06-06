public  class DmlAssignment {
    public static void insert_Dml() {
        Account acc1 = new Account();
        acc1.Name = 'Muberra Sssignment ';
        Account acc2 = new Account();
        acc2.Name = ' Muberra Assignment';
        insert acc1;
        insert acc2;
    }
    public static void updating_dml() {
        Account acc1 = new Account();
        acc1.Name = 'Account Created';
        insert acc1;
        acc1.Name ='Account Updated';
        update acc1;
    }
    public static void createBulkContacts() {
        List<Contact> listcon = new List<Contact>();
        for (Integer i= 1; i<=4; i++) {
            Contact c = new Contact();
            c.FirstName = 'Mark ';
            c.LastName ='Rufallo';
            listcon.add(c);
        }
        if (!listcon.isEmpty()) {
            insert listcon;
        }
        List<Contact> listCon2 = new List<Contact>();
            for (integer i=1; i<=3; i++) {
                Contact c2 = new Contact();
                c2.FirstName = 'Chris ';
                c2.LastName = 'Hemsworth';
                listCon2.add(c2);
            }
            if (!listCon2.isEmpty()) {
                insert listCon2;
            }
            List<Contact> listCon3 = new List<Contact>();
            for (Integer i= 1; i<=3; i++) {
                Contact c3 = new Contact();
                c3.FirstName = 'Scarlett ';
                c3.LastName = 'Johanson';
                listCon3.add(c3);
            }
            if (!listCon3.isEmpty()) {
                insert listCon3;
            }
        }
        public static integer updateBulkContacts(string lastname, string phoneNumber) {
            integer numOfUpdatedContact = 0;
            List<Contact> conList = [select id, lastname, phone FROM Contact WHERE LastName=:lastname];
            List<Contact> newListCon = new List<Contact>();
            for (Contact eachCon : conList) {
                eachCon.Phone= phoneNumber;
                newListCon.add(eachCon);
            }
            numOfUpdatedContact= newListCon.size();
            update conList;
            return numOfUpdatedContact;
        }

        
    }
