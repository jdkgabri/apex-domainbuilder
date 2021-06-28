trigger OpportunityTrigger on Opportunity (before insert) {

    Set<Id> accountIds = new Set<Id>();
    for (Opportunity o : Trigger.new) {
        accountIds.add(o.AccountId);
    }

    Map<String, List<Contact>> contactsByAccountId = new Map<String, List<Contact>>();
    List<Contact> contacts = [SELECT AccountId, (SELECT Id FROM Cases) FROM Contact WHERE AccountId IN :accountIds];

    for (Contact c : contacts) {
        if (!contactsByAccountId.containsKey(c.AccountId)) {
            contactsByAccountId.put(c.AccountId, new List<Contact>());
        }
        contactsByAccountId.get(c.AccountId).add(c);
    }

    for (Opportunity o : Trigger.new) {
        List<Contact> cons = contactsByAccountId.get(o.AccountId);
        Boolean addError = true;

        for (Contact c : cons) {
            if (!c.Cases.isEmpty()) {
                addError = false;
            }
        }

        if (addError) {
            o.addError('At least one contact of the parent opportunity account should have related cases');
        }
    }
}