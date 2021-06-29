@IsTest
public class Pipeline extends DomainBuilder {

    public Pipeline(Repository rep) {
        super(copado__Deployment_Flow__c.SObjectType);
        setParent(copado__Deployment_Flow__c.copado__Git_Repository__c, rep);

        set(copado__Deployment_Flow__c.copado__Active__c, true);
        set(copado__Deployment_Flow__c.copado__Main_Branch__c, 'main');
    }

    public Pipeline() {
        this( new Repository() );
    }

    public Pipeline add(Connection con) {
        return (Pipeline) con.setParent(copado__Deployment_Flow_Step__c.copado__Deployment_Flow__c, this);
    }

    public Pipeline add(Project prj) {
        return (Pipeline) prj.setParent(copado__Project__c.copado__Deployment_Flow__c, this);
    }
}