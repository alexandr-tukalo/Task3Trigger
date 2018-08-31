@istest
public class testmytrigger {
    
    @isTest Static void TestRestictedname(){
        List<Lead> newLead = New List<Lead>();
        Lead c0 = new Lead(LeadSource ='Facebook', Company = 'Testcontact', LastName ='sdsss', Status = 'Open - Not Contacted');
        newLead.add(c0);
        Lead c1 = new Lead(LeadSource ='Facebook', Company = 'Testcontact1', LastName ='sdsss1', Status = 'Open - Not Contacted');
        newLead.add(c1);
        Lead c2 = new Lead(LeadSource ='Facebook', Company = 'Testcontact2', LastName ='sdss2', Status = 'Open - Not Contacted');
        newLead.add(c2);
        Lead c3 = new Lead(LeadSource ='Facebook', Company = 'Testcontact3', LastName ='sdss3', Status = 'Open - Not Contacted');
        newLead.add(c3);
        Lead c4 = new Lead(LeadSource ='Facebook', Company = 'Testcontact3', LastName ='sdss3', Status = 'Open - Not Contacted');
        newLead.add(c4);
        Lead c5 = new Lead(LeadSource ='Facebook', Company = 'Testcontact3', LastName ='sdss3', Status = 'Open - Not Contacted');
        newLead.add(c5);
        Lead c6 = new Lead(LeadSource ='Facebook', Company = 'Testcontact3', LastName ='sdss3', Status = 'Open - Not Contacted');
        newLead.add(c6);
        system.Test.startTest(); 
        Database.SaveResult[] srList = Database.insert(newLead, false); 
        system.Test.stopTest();

        }
}