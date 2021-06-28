@IsTest
public class Case_t extends DomainBuilder {

    public Case_t() {
        super(Case.SObjectType);
    }

    public Case_t(Account_t a) {
        this();
        setParent(Case.AccountId, a);
    }

    public Case_t(Contact_t c) {
        this();
        setParent(Case.ContactId, c);
    }
}