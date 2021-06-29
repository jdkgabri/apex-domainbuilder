@IsTest
public class Project extends DomainBuilder {

    public Project() {
        super(copado__Project__c.SObjectType);
        setParent(copado__Project__c.copado__Deployment_Flow__c, new Pipeline());
    }

    public Project(Pipeline pip) {
        this(pip);
    }

    public Project add(Release rel) {
        return (Project) rel.setParent(copado__Release__c.copado__Project__c, this);
    }

    public Project add(Promotion pro) {
        return (Project) pro.setParent(copado__Promotion__c.copado__Project__c, this);
    }
}