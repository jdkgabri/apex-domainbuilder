@IsTest
public class AccountExtra_t extends DomainBuilder {

	public AccountExtra_t() {
		super(Account.SObjectType);
		name('Acme Corp');
	}

	public AccountExtra_t name(String value) {
		return (AccountExtra_t) set(Account.Name, value);
	}


	public AccountExtra_t add(Opportunity_t o) {
		return (AccountExtra_t) o.setParent(Opportunity.AccountId, this);
	}

	public AccountExtra_t add(Contact_t c) {
		return (AccountExtra_t) c.setParent(Contact.AccountId, this);
	}
    public AccountExtra_t contact(Contact_t c) {
        setParent(Account.MainContact__c, c);
        return this;
    }

    public override AccountExtra_t add(Contact_t c) {
        return (AccountExtra_t) c.setParent(Contact.AccountId, this);
    }
}
