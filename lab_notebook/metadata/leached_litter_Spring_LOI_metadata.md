# Leached Litter Spring Experiment Initial and Final LOI Data

## Spring 2016

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: Measurements taken from experiment set up (3 Feb 2016). 

File created on:  19 Feb 2016

Modified:

* 27 July 2016 - KF - added additional calculated variables on bulk density

* 17 Aug 2016 - KF added the final LOI data

### Variables:

* time = whether the sample was from before (init) or after (final) the experiment
* bod = the ID of the BOD bottle
* treatment = the ID of the treatment level
  * LS = sediment + 20 leaf discs
  * S = sediment only
* sample = the leaf or sediment removed from the BOD bottles for anaylsis
* cruc = number marked on crucible
* cruc.mass = dry mass of each empty crucible
* cruc.remass = dry mass of the empty crucibles that were reweiged on 19 Feb 2016 due to questions about the original mass
* cruc.sed = dry mass of crucible with sediment OR leaf discs
* cruc.ash = dry mass of crucible with ash mass of sediment OR leaf discs
* leaf.num = number of leaf discs placed in crucibles to be ashed
* sed.vol = the volume of sediment slurry collected (ml)

### Calculated Variables:

* sed.mass = the mass of the sediments or leaf matter in the crucible (g)
* ash.mass = the mass of the material in the crucible after ashing for > 4 h at 550 dC (g)
* propOM = the proportion of the sediment or leaf sample that is organic matter
* AFDM.sample = the ash free dry mass of the whole sample in the crucible (g)
* AFDM.leaf = the estimated ash free dry mass of an individual leaf disk (g)
* dry.bulk = the dry bulk density of the sediments (g / ml)

## R Code
### Entered Data

    time <- c(rep("init", 8), rep("final", 15))
    sample <- c("leaf", "leaf", "leaf", "leaf", "leaf", "sed", "sed", "sed", rep("sed", 10), rep("leaf", 5))
    bod <- c(rep(NA, 8), 7, 3, 10, 6, 2, 4, 5, 9, 8, 1, 7, 2, 4, 8, 1)
    treatment <- c(rep(NA, 8), "LS", "S", "S", "S", "LS", "LS", "S", "S", "LS", "LS", rep("LS", 5))
    cruc <- c(21, 10, 5, 8, 23, 18, 6, 16, 13, 15, 24, 20, 23, 21, 16, 6, 9, 8, 18, 5, 1, 4, 10)
    cruc.old.mass <- c(31.0030, 29.7522, 30.3808, 28.9681, 28.8172, 29.4371, 31.5170, 28.8739, rep(NA, 15))
    cruc.mass <- c(31.0025, 29.7509, 30.3798, 28.9667, 28.8163, 29.4370, 30.3798, 28.8734,  29.7282, 26.9930, 29.3992, 29.1397, 28.8181, 31.0083, 28.8747, 31.5173, 27.0818, 28.9675, 29.4380, 30.3815, 29.7390, 27.4887, 29.7533)
    cruc.wet <- (rep(NA, 8), 30.4992, 27.9673, 30.7190, 30.2272, 29.8014, 32.0609, 29.8445, 32.5892, 27.9924, 29.8614, rep(NA, 5))
    cruc.sed <- c(31.0620, 29.8203, 30.4333, 29.0352, 28.8584, 30.2519, 32.3527, 29.7071, 29.8747, 27.1863, 29.6612, 29.3541, 29.0103, 31.1956, 29.0346, 31.7214, 27.2586, 29.1347, 29.4842, 30.4207, 29.7720, 27.5213, 29.8104)
    cruc.ash <- c(31.0038, 29.7518, 30.3782, 28.9612, 28.8178, 30.1161, 32.2115, 29.5674, 29.8475, 27.1496, 29.6157, 29.3178, 28.9743, 31.1618, 29.0010, 31.6809, 27.2225, 29.1053, 29.4499, 30.3849, 29.7416, 27.4914, 29.7629)
    leaf.num <- c(20, 20, 20, 20, 20, NA, NA, NA, rep(NA, 10), rep(20, 5))
    sed.vol <- c(NA, NA, NA, NA, NA, 5, 5, 5, 0.8, 1.3, 1.2, 1.2, 1.0, 1.1, 0.9, 1.1, 1.1, 1.0, rep(NA, 5))
    
### Calculations

    sed.mass <- cruc.sed - cruc.mass
    ash.mass <- cruc.ash - cruc.mass
    propOM <- (sed.mass - ash.mass) / sed.mass
    AFDM.sample <- sed.mass * propOM
    AFDM.leaf <- AFDM.sample / leaf.num
    dry.bulk <- sed.mass / sed.vol

## Data Frame

    leach.OM <- data.frame(time, bod, treatment, sample, leaf.num, sed.vol, cruc, cruc.mass, cruc.sed, cruc.ash, sed.mass, ash.mass, propOM, AFDM.sample, AFDM.leaf, dry.bulk)

## Output File 

    write.table(leach.OM, "data/leached_litter_Spring_LOI_sp2016.csv", sep = ",", row.names = F, quote = F) 

