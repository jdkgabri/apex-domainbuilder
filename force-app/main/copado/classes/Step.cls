@IsTest
public class Step extends DomainBuilder {

    public Step(Deployment dep) {
        super(copado__Step__c.SObjectType);
        setParent(copado__Step__c.copado__Deployment__c, dep);
    }

    public Step() {
        this ( new Deployment() );
    }
}