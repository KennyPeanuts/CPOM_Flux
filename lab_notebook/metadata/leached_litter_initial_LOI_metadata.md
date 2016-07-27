# Leached Litter Initial LOI Data

## 17 Sept 2015

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: Measurements taken in order to break down leached litter experiment (5 November 2015). 

File created on: 26 July 2016 

Modified:

### Variables:

* sample = the leaf or sediment removed from the BOD bottles for anaylsis
* sed.vol = the volume of the sediment sample collected from the slurry (ml)
* cruc = number marked on crucible
* cruc.mass = dry mass of each empty crucible (g)
* cruc.wet = mass of the crucible and the wet mass of the sediments (g)
* cruc.sed = dry mass of crucible with sediment OR leaf discs (g)
* cruc.ash = dry mass of crucible with ash mass of sediment OR leaf discs (g)
* leaf.num = number of leaf discs placed in crucibles to be ashed

### Calculated Variables:

* sed.mass = the mass of the sediments or leaf matter in the crucible (g)
* ash.mass = the mass of the material in the crucible after ashing for > 4 h at 550 dC (g)
* propOM = the proportion of the sediment or leaf sample that is organic matter
* AFDM.sample = the ash free dry mass of the whole sample in the crucible (g)
* AFDM.leaf = the estimated ash free dry mass of an individual leaf disk (g)
* dry.bulk = the dry bulk density of the sediments (g/cm^3)

## R Code
### Entered Data

    sample <- c(rep("sed", 4), rep("leaf", 4))
    cruc <- c(4, 10, 8, 11, 11, 13, 18, 20)
    sed.vol <- c(5, 5, 5, 5, NA, NA, NA, NA)
    cruc.mass <- c(12.2468, 12.9368, 12.6010, 11.8898, 26.5948, 29.7281, 29.4378, 29.1396)
    cruc.wet <- c(17.3135, 18.3114, 18.2293, 17.3698, NA, NA, NA, NA)
    cruc.sed <- c(12.7499, 13.4709, 13.1621, 12.4359, 26.6216, 29.7759, 29.4760, 29.4760)
    cruc.ash <- c(12.6881, 13.4049, 13.0943, 12.3688, NA, 29.7281, 29.4380, NA)
    leaf.num <- c(NA, NA, NA, NA, 20, 20, 20, 20)

### Calculations

    sed.mass <- cruc.sed - cruc.mass
    ash.mass <- cruc.ash - cruc.mass
    propOM <- (sed.mass - ash.mass) / sed.mass
    AFDM.sample <- sed.mass * propOM
    AFDM.leaf <- AFDM.sample / leaf.num 
    dry.bulk <- sed.mass / sed.vol 

## Data Frame

    leach.initial.OM <- data.frame(sample, cruc, cruc.mass, cruc.sed, cruc.ash, sed.mass, ash.mass, propOM, AFDM.sample, leaf.num, AFDM.leaf, sed.vol, dry.bulk)

## Output File 

    write.table(leach.initial.OM, "data/leached_litter_iniitial_LOI_17Sept2015.csv", sep = ",", row.names = F, quote = F) 
