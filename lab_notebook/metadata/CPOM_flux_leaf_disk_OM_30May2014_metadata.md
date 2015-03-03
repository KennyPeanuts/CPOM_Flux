# Initil Determination of the OM content of the leaf disks for the CPOM flux exp.

## Metadata

Collected by: KDP and KF

Collected on: 30 May 2014

Affiliation: Longwood University

Location: Longwood University

Description: 

* Senecent tulip poplar leaves were collected and air dried during the fall of 2013

* 5 leaves were each gently submerged in DI water for approx. 5 minutes to soften the leaf

* a 10 mm (#5) cork borer was used to cut a single leaf disk from each leaf, avoiding major veins

* each disk was placed in a pre-weighed crucible and dried at 50 dC, then ashed at 550 dC

Created: 5 June 2014

Modified:

### Variables

#### Measured Variables

* rep = the replicate identifier

* cruc = the crucible identiying number

* cruc.mass = the mass of the empty crucible (g)

* cruc.leaf = the mass of the crucible plus the leaf disk drying at 50 dC (g)

* cruc.ash = the mass of the crucible plus the ash after 4 h at 550 dC (g)

#### Calculated Variables

* leaf = the dry mass of the leaf disk (g)

* ash = the mass of the ash after 4 h at 550 dC (g)

* prop.OM = the proportion of organic matter in the leaf disk

* AFDM = the ash free dry mass of the leaf disk


## R Code

    rep <- c(1:5)
    cruc <- c(1:5)
    cruc.mass <- c(31.5145, 28.1980, 28.9668, 27.0792, 29.7503)
    cruc.leaf <- c(31.5169, 28.2001, 28.9695, 27.0837, 29.7544)
    cruc.ash <- c(31.5148, 28.1981, 28.9672, 27.0797, 29.7508)

### Calculated Variables

    leaf <- cruc.leaf- cruc.mass
    ash <- cruc.ash - cruc.mass
    prop.OM <- 1 - (ash / leaf)
    AFDM <- leaf * prop.OM

    leafOM <- data.frame(rep, cruc, cruc.mass, cruc.leaf, cruc.ash, leaf, ash, prop.OM, AFDM)

## Output

    write.table(leafOM, "./data/CPOM_flux_leaf_disk_OM_inital_30May2014.txt", row.names = F, sep = "\t", quote = F) 
