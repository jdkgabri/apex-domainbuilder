@IsTest
public class Contact_t extends DomainBuilder {

    public Contact_t() {
        super(Contact.SObjectType);

        last(new Random().string());
    }

    public Contact_t(Account_t a) {
        this();
        setParent(Contact.AccountId, a);
    }

    public Contact_t add(Case_t c) {
		return (Contact_t) c.setParent(Case.ContactId, this);
	}

    public Contact_t first(String value) {
        return (Contact_t) set(Contact.FirstName, value);
    }

    public Contact_t last(String value) {
        return (Contact_t) set(Contact.LastName, value);
    }

    public Contact_t email(String value) {
        return (Contact_t) set(Contact.Email, value);
    }

    public Contact_t reports(Contact_t c) {
        return (Contact_t) setParent(Contact.ReportsToId, c);
    }
}