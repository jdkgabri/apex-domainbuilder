@IsTest
private class OldPromotionTest {

    private static Long startTime;

    // Note: execute this test in an developer org of the main copado package

    /* @IsTest
    private static void usingTestFactory() {

        startTime = System.currentTimeMillis();

        Project__c TestProject = CMTestMethodUtilities.createProject('Test project');
        insert TestProject;
        Environment__c env1 = CMTestMethodUtilities.createEnvironment('UAT Environment', '000000000000000001');
        insert env1;
        Environment__c env2 = CMTestMethodUtilities.createEnvironment('Production Environment', '000000000000000002');
        insert env2;
        Org__c TestOrg1 = CMTestMethodUtilities.createOrg('MyOrg1', 'Production', '000000000000000001', null, null, System.now(), env1.Id);
        insert TestOrg1;
        Org__c TestOrg2 = CMTestMethodUtilities.createOrg('MyOrg2', 'Production', '000000000000000002', null, null, System.now(), env2.Id);
        insert TestOrg2;
        Deployment_Flow__c flow = CMTestMethodUtilities.createCCMFlow('Standard flow', true);
        insert flow;
        Deployment_Flow_Step__c dfs = CMTestMethodUtilities.createFlowStep(env1.Id, env2.Id, flow.Id);
        insert dfs;
        TestProject.Deployment_Flow__c = flow.Id;
        update TestProject;
        Promotion__c TestPromotion = new Promotion__c();
        TestPromotion.Project__c = TestProject.Id;
        TestPromotion.Source_Environment__c = env1.Id;
        TestPromotion.Send_Deployment_Complete_email__c = false;

        insert TestPromotion;
        Promotion__c result = [
            SELECT Id, Source_Environment__c, Destination_Environment__c
            FROM Promotion__c
            WHERE Id = :TestPromotion.Id
            LIMIT 1
        ];
        System.assertEquals(env2.Id, result.Destination_Environment__c);
        TestPromotion.Destination_Environment__c = null;
        update TestPromotion;

        result = [SELECT Id, Source_Environment__c, Destination_Environment__c FROM Promotion__c WHERE Id = :TestPromotion.Id LIMIT 1];
        System.assertEquals(env2.Id, result.Destination_Environment__c);

        logLimits();
    }

    // HELPER

    @TestSetup
    private static void setup() {

        GlobalAPI.UserLicense licence = GlobalAPI.UserLicense();
        licence.isCADEnabled = true;
        licence.isCCHEnabled = true;
        licence.isCCMEnabled = true;
        licence.isCopadoEnabled = true;
        licence.isCSTEnabled = true;
        licence.userId = UserInfo.getUserId();

        new GlobalAPI().upsertCopadoLicense(licence);
    } */

    private static void logLimits() {

        System.debug(System.currentTimeMillis() - startTime);
        System.debug(Limits.getCpuTime());
        System.debug(Limits.getDMLRows());
        System.debug(Limits.getDMLStatements());
        System.debug(Limits.getHeapSize());
        System.debug(Limits.getQueries());
        System.debug(Limits.getQueryRows());
    }
}