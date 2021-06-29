@IsTest
public class Promotion extends DomainBuilder {

    public Promotion(Project prj, Release rls, Credential source, Environment sourceEnv, Credential dest, Environment destEnv) {
        super(copado__Promotion__c.SObjectType);
        setParent(copado__Promotion__c.copado__Project__c, prj);
        setParent(copado__Promotion__c.copado__Release__c, rls);
        setParent(copado__Promotion__c.copado__Source_Org_Credential__c, source);
        setParent(copado__Promotion__c.copado__Source_Environment__c, sourceEnv);
        setParent(copado__Promotion__c.copado__Destination_Org_Credential__c, dest);
        setParent(copado__Promotion__c.copado__Destination_Environment__c, destEnv);

        Pipeline pip = (Pipeline) prj.parentByRelationship.get(copado__Project__c.copado__Deployment_Flow__c);

        new Connection(pip, sourceEnv, destEnv);
    }

    public Promotion(Release rls, Credential source, Credential dest) {
        this( (Project) rls.parentByRelationship.get(copado__Release__c.copado__Project__c), rls, source, (Environment) source.parentByRelationship.get(copado__Org__c.copado__Environment__c), dest, (Environment) dest.parentByRelationship.get(copado__Org__c.copado__Environment__c) );
    }

    public Promotion() {
        super(copado__Promotion__c.SObjectType);
    }
}