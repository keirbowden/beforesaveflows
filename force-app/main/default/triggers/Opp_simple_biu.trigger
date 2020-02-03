trigger Opp_simple_biu on Opportunity (before insert, before update) 
{
    for (Opportunity opp : trigger.new)
    {
        opp.Name=opp.Name + '-' + opp.Amount;
    }
}