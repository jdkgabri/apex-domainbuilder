@IsTest
public class Environment extends DomainBuilder {

    public Environment() {
        super(copado__Environment__c.SObjectType);
    }

    public Environment add(Credential cred) {
        return (Environment) cred.setParent(copado__Org__c.copado__Environment__c, this);
    }

    public Environment add(Promotion pro) {
        return (Environment) pro.setParent(copado__Promotion__c.copado__Source_Environment__c, this);
    }
}