# Decomp Priming Experiment Initial LOI

## Spring 2016

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: Measurements taken from set up of experiment (3 Feb 2016). 

File created on:  19 Feb 2016

Modified:


### Variables:


* sample = the leaf or sediment removed from the BOD bottles for anaylsis
* cruc = number marked on crucible
* cruc.mass = dry mass of each empty crucible
* cruc.remass = dry mass of the empty crucibles that were reweiged on 19 Feb 2016 due to questions about the original mass
* cruc.sed = dry mass of crucible with sediment OR leaf discs
* cruc.ash = dry mass of crucible with ash mass of sediment OR leaf discs
* leaf.num = number of leaf discs placed in crucibles to be ashed

### Calculated Variables:

* sed.mass = the mass of the sediments or leaf matter in the crucible (g)
* ash.mass = the mass of the material in the crucible after ashing for > 4 h at 550 dC (g)
* propOM = the proportion of the sediment or leaf sample that is organic matter
* AFDM.sample = the ash free dry mass of the whole sample in the crucible (g)
* AFDM.leaf = the estimated ash free dry mass of an individual leaf disk (g)

## R Code
### Entered Data

    sample <- c("leaf", "leaf", "leaf", "leaf", "leaf", "leaf", "leaf", "leaf", "leaf", "sed", "sed", "sed")
    cruc <- c(15, 9, 13, 2, 24, 20, 1, 7, 4, 18, 6, 16)
    cruc.mass <- c(26.9927, 27.0812, 29.7280, 26.6541, 29.3995, 29.1398, 29.7392, 28.1992, 27.4885, 29.4371, 31.5170, 28.8739)
    cruc.remass <- (26.9914, 27.0801, 29.7264, 26.6526, 29.3978, 29.1390, 29.7371, 28.1981, 27.4870, 29.4370, 30.3798, 28.8734)
    cruc.sed <- c(27.0267, 27.1137, 29.7571, 26.6856, 29.4370, 29.1725, 29.7712, 28.2330, 27.5245, 30.2519, 32.3527, 29.7071)
    cruc.ash <- c(26.9934, 27.0733, 29.7286, 26.6537, 29.3948, 29.1357, 29.7350, 28.1991, 27.4890, 30.1161, 32.2115, 29.5674)
    leaf.num <- c(10, 10, 10, 10, 10, 10, 10, 10, 10, 10, NA, NA, NA)

### Calculations

    sed.mass <- cruc.sed - cruc.mass
    ash.mass <- cruc.ash - cruc.mass
    propOM <- (sed.mass - ash.mass) / sed.mass
    AFDM.sample <- sed.mass * propOM
    AFDM.leaf <- AFDM.sample / leaf.num    

## Data Frame

    leach.OM <- data.frame(bod, treat, sample, leaf.num, cruc, cruc.mass, cruc.sed, cruc.ash, sed.mass, ash.mass, propOM, AFDM.sample, AFDM.leaf)

## Output File 

    write.table(leach.OM, "data/leached_litter_LOI_Spring2016.csv", sep = ",", row.names = F, quote = F) 
