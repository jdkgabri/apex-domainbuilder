@IsTest
private class NewPromotionTest {

    private static Long startTime;

    @IsTest
    private static void usingDomainBuilder() {

        startTime = System.currentTimeMillis();

        // Setup

        Environment env = new Environment();

        Promotion pro = new Promotion();

        new Pipeline()
                .add( new Connection(
                            new Environment()
                                    .add( new Credential() )
                                    .add( pro ),
                            env.add( new Credential() )))
                .add( new Project()
                            .add( new Release() )
                            .add( pro ))
                .persist();

        copado__Promotion__c result = [SELECT Id, copado__Source_Environment__c, copado__Destination_Environment__c FROM copado__Promotion__c];

        // Verify

        System.assertEquals(env.record.Id, result.copado__Destination_Environment__c);
        result.copado__Destination_Environment__c = null;
        update result;
        result = [SELECT Id, copado__Source_Environment__c, copado__Destination_Environment__c FROM copado__Promotion__c];
        System.assertEquals(env.record.Id, result.copado__Destination_Environment__c);

        logLimits();
    }


    // HELPER

    @TestSetup
    private static void setup() {

        copado.GlobalAPI.UserLicense licence = new copado.GlobalAPI.UserLicense();
        licence.isCADEnabled = true;
        licence.isCCHEnabled = true;
        licence.isCCMEnabled = true;
        licence.isCopadoEnabled = true;
        licence.isCSTEnabled = true;
        licence.userId = UserInfo.getUserId();

        new copado.GlobalAPI().upsertCopadoLicense(licence);
    }

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