@istest
public class CreatePSRTest {
    
    @istest
    public static void CreatePSROnCase_Test(){
        
        Account acc = new Account(Name='My Account');
        insert acc;
        
        Entitlement ent = new Entitlement(Name='Testing', AccountId=acc.Id, 
                                          StartDate=Date.valueof(System.now().addDays(-2)), EndDate=Date.valueof(System.now().addYears(2)));
        insert ent;
        User U = [SELECT Id, Name, Email, Profile.Name, UserRole.Name FROM User
                         Where Id=:userinfo.getUserId() LIMIT 1];
        Case c = New Case();
        c.Urgency__c = 'Violation';
        c.Status = 'New';
        c.EntitlementId = ent.Id;
        c.OwnerId = U.Id;
        insert c;
        List<Case> caseList = New List<Case>();
        caselist.add(c);
  
        
        CreatePSR.CreatePsrForCase psr = new CreatePSR.CreatePsrForCase();
        psr.caseList = caseList;
        Test.startTest();
        CreatePSR.CreatePSROnCase(new List<CreatePSR.CreatePsrForCase>{psr});
        Test.stopTest();
    }

}