public with sharing class Benchmark {
    public static void CreateAccounts()
    {
        List<Account> accs=new List<Account>();
        for (Integer idx=1; idx<=250; idx++)
        {
            Account acc=new Account(Name='Test Account ' + idx);
            accs.add(acc);
        }

        insert accs;
    }

    public static void Benchmark()
    {
        List<Account> accounts=[select id from Account];
        List<Opportunity> toInsert=new List<Opportunity>();
        for (Integer otter=0; otter<5; otter++) {
            for (Integer idx=0; idx<200; idx++)
            {
                Opportunity opp=new Opportunity(Name='tbd',
                                               AccountId=accounts[idx].Id,
                                               CloseDate=System.today(),
                                               Amount=(100000*otter)+(1000*idx),
                                               StageName='Prospecting',
                                               Probability=10);
                toInsert.add(opp);
            }
        }
        insert toInsert;    
        
        List<Opportunity> opps=[select id from opportunity];
        delete opps;        
    }
}
