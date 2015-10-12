# Treatment Assignments for BOD bottles 

## Metadata

Collected by: KF, JM

Collected on: 18 Sept 2015

Affiliation: Lomgwood University 

Location: NA

Description: 

Treatments were randomly assigned to BOD bottles with sediment. Those without sediment were assigned haphazardly as sediment was added to the bottles during set-up

Created: 12 Oct 2015

Modified:

### Variables:

* bod = the identifying number of the BOD bottle

* treat = the treatment identifier, where:

    * L = leaf only, no sediment
    * S = sediment only
    * LS = leaf and sediment
    
## R Code

### Data Entry
  
    bod <- 1:12
    treat <- c("L", "L", "L", "L", "LS", "LS", "LS", "S", "S", "LS", "S", "S")
    
## Output

    treat <- data.frame(bod, treat) 

    write.table(treat, "./data/leached_litter_treatments_fall2015.csv", quote = F, row.names = F, sep = ",")    
