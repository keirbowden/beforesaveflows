# Flow vs Trigger Benchmark repo

Note all execute anonymous is taking place in the developer console.

## Setup
1. Push to scratch org

1. Execute anonymous :
    
    `Benchmark.CreateAccounts();`
    
## Simple Flow

(I got around 100 CPU time in fresh scratch org and pre-release)

1. Activate flow Simple Set Name
    
1. Execute anonymous :
    
   `Benchmark.Benchmark();`
    
1. Deactivate flow Simple Set Name

## Simple Trigger

(I got around 1000 CPU time in fresh scratch org and pre-release)

1. Activate trigger Opp_simple_biu
    
1. Execute anonymous :
    
   `Benchmark.Benchmark();`
    
1. Deactivate trigger Opp_simple_biu

## Lookup Flow

(I got around 100 CPU time in fresh scratch org and pre-release)

1. Activate flow Set Opportunity Name
    
1. Execute anonymous :
    
   `Benchmark.Benchmark();`
    
1. Deactivate flow Set Opportunity Name

## Lookup Trigger

(I got 2800 CPU time in fresh scratch org and 8000 plus in pre-release)

1. Activate trigger Opp_lookup_biu
    
1. Execute anonymous :
    
   `Benchmark.Benchmark();`
    
1. Deactivate trigger Opp_lookup_biu

# Combination

(I got 2700 CPU in a fresh scratch org and 8900 CPU in a pre-release org)

1. Activate trigger Opp_simple_biu

1. Activate flow Add to Trigger

1. Execute anonymous :
    
   `Benchmark.Benchmark();`
    
1. Deactivate trigger Opp_simple_biu

1. Deactivate flow Add to Trigger


Workflow logging was set to FINER in both orgs.
Turning workflow logging down to INFO reduced the CPU usage for this case to 1550 in scratch org and 1844 in pre-release org.

