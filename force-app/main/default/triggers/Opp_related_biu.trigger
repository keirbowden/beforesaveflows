trigger Opp_related_biu on Opportunity (before insert, before update) 
{
    Set<Id> accountIds=new Set<Id>();
	for (Opportunity opp : trigger.new) 
    {
        accountIds.add(opp.AccountId);
    }
    
    Map<Id, Account> accountsById=new Map<Id, Account>(
        [select id, Name from Account where id in :accountIds]);
    for (Opportunity opp : trigger.new)
    {
        Account acc=accountsById.get(opp.AccountId); 
        opp.Name=acc.Name + '-' + opp.CloseDate + '-' + opp.Amount;
    }
}