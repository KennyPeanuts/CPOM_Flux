# Leached Litter LOI Data

## 19 Nov 2015

## Metadata

Collected by: KF, JM, JA 

Affiliation: Longwood University

Description: Measurements taken in order to break down leached litter experiment (5 November 2015). 

File created on:  19 Nov 2015

Modified:

3 Dec 2015 - KF - added data for PRE leaf discs

### Variables:

* bod = the identifying number of the BOD bottle
* treat = the description of the treatment applied to the bottles, where L = leaf discs only, S = sediment only, LS = sediment and leaf discs, and PRE = leaf discs prior to being placed in the exp.
* sample = the leaf or sediment removed from the BOD bottles for anaylsis
* cruc = number marked on crucible
* cruc.mass = dry mass of each empty crucible
* cruc.sed = dry mass of crucible with sediment OR leaf discs
* cruc.ash = dry mass of crucible with ash mass of sediment OR leaf discs
* leaf.num = number of leaf discs placed in crucibles to be ashed

### Calculated Variables:


## R Code

    bod <- c(1, 2, 3, 4, 5, 5, 6, 8, 9, 10, 6, 12, 7, 11, 7, 10, NA, NA)
    treat <- c("L", "L", "L", "L", "LS", "LS", "LS", "S", "S", "LS", "LS", "S", "LS", "S", "LS", "LS", "PRE", "PRE")
    sample <- c("leaf", "leaf", "leaf", "leaf", "sed", "leaf", "sed", "sed", "sed", "sed", "leaf", "sed", "sed", "sed", "leaf", "leaf", "leaf", "leaf")
    cruc <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 15, 20, 24, 13, 18)
    cruc.mass <- c(13.1357, 12.6367, 13.0682, 12.2557, 12.9968, 11.9915, 12.1990, 12.6022, 11.6684, 12.9368, 11.8903, 11.7832, 29.7284, 26.9938, 29.1396, 29.3986, 29.7281, 29.4378)
    cruc.sed <- c(13.1522, 12.6578, 13.0836, 12.2664, 13.1424, 12.0026, 12.2610, 12.6784, 11.7508, 13.0808, 11.9060, 11.7888, 29.8640, 27.1089, 29.1518, 29.4254, 29.7759, 29.4760)
    cruc.ash <- c(13.1366, 12.6373, 13.0684, 12.2457, 13.1246, 11.9934, 12.2523, 12.6684, 11.7397, 13.0638, 11.8947, 11.7872, 29.8470, 27.0937, 29.1427, 29.4091, 29.7281, 29.4380)
    leaf.num <- c(12, 12, 12, 12, NA, 9, NA, NA, NA, NA, 9, NA, NA, NA, 9, 12, 20, 20)

    sed.mass <- cruc.sed - cruc.mass
    ash.mass <- cruc.ash - cruc.mass
    propOM <- (sed.mass - ash.mass) / sed.mass

    leach.OM <- data.frame(bod, treat, sample, leaf.num, cruc, cruc.mass, cruc.sed, cruc.ash, sed.mass, ash.mass, propOM)

## Output File 

    write.table(leach.OM, "data/leached_litter_LOI_5nov2015.csv", sep = ",", row.names = F, quote = F) 
