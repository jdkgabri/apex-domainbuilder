@IsTest
public class Deployment extends DomainBuilder {

    copado__Promotion__c pro;

    public Deployment() {
        super(copado__Deployment__c.SObjectType);
    }

    public Deployment(Promotion pro) {
        this();
        this.pro = (copado__Promotion__c) pro.record;
        new Destination(this).set(copado__Destination_Org__c.copado__To_Org__c, this.pro.copado__Source_Org_Credential__c);
        set(copado__Deployment__c.copado__Promotion__c, this.pro.Id);
    }

    public Deployment add(Step step) {
        return (Deployment) step.setParent(copado__Step__c.copado__Deployment__c, this);
    }

    public Deployment add(UserStory us) {
        us.set(copado__User_Story__c.copado__Project__c, pro.copado__Project__c);
        us.set(copado__User_Story__c.copado__Release__c,  pro.copado__Release__c);
        us.set(copado__User_Story__c.copado__Org_Credential__c,  pro.copado__Source_Org_Credential__c);
        us.set(copado__User_Story__c.copado__Environment__c,  pro.copado__Source_Environment__c);
        us.set(copado__User_Story__c.copado__Last_Validation_Promotion__c,  pro.Id);

        return (Deployment) us.setParent(copado__User_Story__c.copado__Last_Validation_Deployment__c, this);
    }
}