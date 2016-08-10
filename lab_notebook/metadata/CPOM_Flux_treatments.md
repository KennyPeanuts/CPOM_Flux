# Treatment Assignments for BOD bottles in the Litter Experiment (CPOM Flux)

## Metadata

Collected by: KF, KP 

Collected on: 9 June 2014

Affiliation: Longwood University 

Location: NA

Description: 

Treatments were randomly assigned to BOD bottles. 

Created: 10 Aug 2016

Modified:

### Variables:

* bod = the identifying number of the BOD bottle

* litter = the treatment identifier, where:

  * S = sediment only
  * LS = leaf and sediment
 
* nut = the treatment identifier, where:

  * NUT = added DIP and DIN
  * AMB = ambient pond water nutriets
  
## R Code

### Data Entry
  
    bod <- 1:16
    litter <- c("LS", "S", "S", "LS", "S", "LS", "S", "S", "S", "LS", "LS", "LS", "LS", "S", "S", "LS")
    nut = c("AMB", "NUT", "AMB", "NUT", "AMB", "AMB", "NUT", "AMB", "AMB", "NUT", "NUT", "AMB", "AMB", "NUT", "NUT", "NUT")
    
## Output

    treat <- data.frame(bod, litter, nut) 

    write.table(treat, "./data/CPOM_Flux_treatments_summer2014.csv", quote = F, row.names = F, sep = ",")    
