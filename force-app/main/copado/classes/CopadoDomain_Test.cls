@IsTest
public class CopadoDomain_Test {

    @TestSetup
    private static void setup(){

        copado.GlobalAPI.UserLicense licence = new copado.GlobalAPI.UserLicense();
        licence.isCADEnabled=true;
        licence.isCCHEnabled=true;
        licence.isCCMEnabled=true;
        licence.isCopadoEnabled=true;
        licence.isCSTEnabled=true;
        licence.userId = UserInfo.getUserId();

        new copado.GlobalAPI().upsertCopadoLicense(licence);
    }

    @IsTest
    private static void happyPath() {

        // Exercise
        Promotion pro = new Promotion();

        pro.persist();

        new Deployment(pro)
                .add( new Step() )
                .add( new UserStory() )
            .persist();

        // Verify
        System.assertEquals(2, [SELECT Count() FROM copado__Org__c]);
        System.assertEquals(2, [SELECT Count() FROM copado__Environment__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Deployment_Flow__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Git_Repository__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Deployment_Flow_Step__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Project__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Release__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Promotion__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Deployment__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Destination_Org__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Step__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__User_Story__c]);

        // Further asserts on actual fields
    }

    @IsTest
    private static void createPromotion() {

        // Exercise
        new Promotion().persist();

        // Verify
        System.assertEquals(2, [SELECT Count() FROM copado__Org__c]);
        System.assertEquals(2, [SELECT Count() FROM copado__Environment__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Deployment_Flow__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Git_Repository__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Deployment_Flow_Step__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Project__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Release__c]);
        System.assertEquals(1, [SELECT Count() FROM copado__Promotion__c]);

        // Further asserts on actual fields
    }
}