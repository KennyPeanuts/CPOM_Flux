# Leached Litter Spring Experiment Initial LOI Data

## Spring 2016

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: Measurements taken from experiment set up (3 Feb 2016). 

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

    sample <- c("leaf", "leaf", "leaf", "leaf", "sed", "sed", "sed")
    cruc <- c(21, 10, 5, 8, 23, 18, 6, 16)
    cruc.mass <- c(31.0030, 29.7522, 30.3808, 28.9681, 28.8172, 29.4371, 31.5170, 28.8739)
    cruc.remass <- (31.0025, 29.7509, 30.3798, 28.9667, 28.8163, 29.4370, 30.3798, 28.8734)
    cruc.sed <- c(31.0620, 29.8203, 30.4333, 29.0352, 28.8584, 30.2519, 32.3527, 29.7071)
    cruc.ash <- c(31.0038, 29.7518, 30.3782, 28.9612, 28.8178, 30.1161, 32.2115, 29.5674)
    leaf.num <- c(20, 20, 20, 20, 20, NA, NA, NA)

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
