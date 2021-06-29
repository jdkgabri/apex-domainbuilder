@IsTest
public class Destination extends DomainBuilder {

    public Destination(Deployment dep, Credential cred) {
        super(copado__Destination_Org__c.SObjectType);
        setParent(copado__Destination_Org__c.copado__Deployment__c, dep);
        setParent(copado__Destination_Org__c.copado__To_Org__c, cred);
    }

    public Destination(Deployment dep) {
        super(copado__Destination_Org__c.SObjectType);
        setParent(copado__Destination_Org__c.copado__Deployment__c, dep);
    }
}