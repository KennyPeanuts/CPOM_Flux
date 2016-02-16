# Treatment Assignments for BOD bottles 

## Metadata

Collected by: KF, JM

Collected on:  9 Feb 2016

Affiliation: Lomgwood University 

Location: NA

Description: 

Treatments were randomly assigned to BOD bottles with sediment. Those without sediment were assigned haphazardly as sediment was added to the bottles during set-up

Created: 16 Feb 2016

Modified:

### Variables:

* bod = the identifying number of the BOD bottle

* treat = the treatment identifier, where:

    * S = sediment only
    * LS = leaf and sediment
    
## R Code

### Data Entry
  
    bod <- 1:10
    treat <- c("LS", "LS", "S", "LS", "S", "S", "LS", "LS", "S", "S")
    
## Output

    treat <- data.frame(bod, treat) 

    write.table(treat, "./data/leached_litter_treatments_Spring2016.csv", quote = F, row.names = F, sep = ",")    
