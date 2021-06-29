@IsTest
public class Deployment extends DomainBuilder {

    Promotion pro;

    public Deployment() {
        super(copado__Deployment__c.SObjectType);
    }

    public Deployment(Promotion pro) {
        this();
        this.pro = pro;
        new Destination(this).set(copado__Destination_Org__c.copado__To_Org__c, pro.record.get('copado__Source_Org_Credential__c'));
        // new Destination(this, (Credential) pro.parentByRelationship.get(copado__Promotion__c.copado__Source_Org_Credential__c));
        set(copado__Deployment__c.copado__Promotion__c, pro.record.Id);
        // setParent(copado__Deployment__c.copado__Promotion__c, pro);
    }

    public Deployment add(Step step) {
        return (Deployment) step.setParent(copado__Step__c.copado__Deployment__c, this);
    }

    public Deployment add(UserStory us) {
        us.set(copado__User_Story__c.copado__Project__c, pro.record.get('copado__Project__c'));
        us.set(copado__User_Story__c.copado__Release__c,  pro.record.get('copado__Release__c'));
        us.set(copado__User_Story__c.copado__Org_Credential__c,  pro.record.get('copado__Source_Org_Credential__c'));
        us.set(copado__User_Story__c.copado__Environment__c,  pro.record.get('copado__Source_Environment__c'));
        us.set(copado__User_Story__c.copado__Last_Validation_Promotion__c,  pro.record.get('Id'));

        /*us.setParent(copado__User_Story__c.copado__Project__c, pro.parentByRelationship.get(copado__Promotion__c.copado__Project__c));
        us.setParent(copado__User_Story__c.copado__Release__c, pro.parentByRelationship.get(copado__Promotion__c.copado__Release__c));
        us.setParent(copado__User_Story__c.copado__Org_Credential__c, pro.parentByRelationship.get(copado__Promotion__c.copado__Source_Org_Credential__c));
        us.setParent(copado__User_Story__c.copado__Environment__c, pro.parentByRelationship.get(copado__Promotion__c.copado__Source_Environment__c));
        us.setParent(copado__User_Story__c.copado__Last_Validation_Promotion__c, pro);*/

        return (Deployment) us.setParent(copado__User_Story__c.copado__Last_Validation_Deployment__c, this);
    }
}