# Initil Determination of the OM content of the leaf disks for the CPOM flux exp.

## Metadata

Collected by: KDP and KF

Collected on: 16 June 2014

Affiliation: Longwood University

Location: Longwood University

Description: 

* Senecent tulip poplar leaves were collected and air dried during the fall of 2013

* 5 leaves were each gently submerged in DI water for approx. 5 minutes to soften the leaf

* a 10 mm (#5) cork borer was used to cut a single leaf disk from each leaf, avoiding major veins

* 20 disks were placed in a pre-weighed crucible and dried at 50 dC, then ashed at 550 dC

Created: 20 June 2014

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

    rep <- c(1:6)
    cruc <- c(1:6)
    cruc.mass <- c(29.7374, 26.6515, 28.0758, 27.4864, 30.3797, 31.5143)
    cruc.leaf <- c(29.8215, 26.7333, 28.1500, 27.5704, 30.4575, 31.6054)
    cruc.ash <- c(29.7448, 26.6582, 28.0818, 27.4946, 30.3864, 31.5220)

### Calculated Variables

    leaf <- cruc.leaf- cruc.mass
    ash <- cruc.ash - cruc.mass
    prop.OM <- 1 - (ash / leaf)
    AFDM <- leaf * prop.OM

    leafOM <- data.frame(rep, cruc, cruc.mass, cruc.leaf, cruc.ash, leaf, ash, prop.OM, AFDM)

## Output

    write.table(leafOM, "./data/CPOM_flux_bottle_OM_16jun2014.csv", row.names = F, sep = ",", quote = F) 

## Calculation of Bottle Organic Matter Content

### Import Sed OM Data

     sedOM <- read.table("./data/CPOM_flux_LPP_sed_OM_inital_29May2014.txt", header = T, sep = "\t")

### Calculate Sed OM in each bottle

        sedOM.mass <- sedOM$prop.OM * sedOM$sed.dry
        sed.OM  <- sedOM.mass / 10
        bod.sedOM <- sed.OM * 100
        mean.bod.sedOM <- mean(bod.sedOM)
        mean.bod.CPOM <- mean(leafOM$AFDM)
        bod.CPOM <- mean.bod.sedOM + mean.bod.CPOM
        bod.noCPOM <- mean.bod.sedOM
        CPOM <- c("yes", "no")
        bottleOM <- data.frame(CPOM, c(bod.CPOM, bod.noCPOM), c(mean.bod.CPOM, 0), c(mean.bod.sedOM, mean.bod.sedOM))
        names(bottleOM) <- c("CPOM", "tot.OM", "leaf.OM", "sed.OM")

        write.table(bottleOM, file = "./data/CPOM_flux_bottleOM_initial.csv", row.names = F, quote = F, sep = ",")

### Calculation variables

* sedOM.mass: AFDM of 10 ml of slurry
* sed.OM: OM in 1ml sediment slurry
* bod.sedOM: amount of OM in the 100 ml slurry in each bod bottle
* mean.bod.sedOM: average of the bod.sedOM samples
* mean.bod.CPOM: average of the leaf disk AFDM samples (20 leaf disks per sample)
* bod.CPOM: cumulative total of OM in bod bottles containing CPOM
* bod.noCPOM:  cumulative total of OM in bod bottles containing no CPOM
* CPOM: Indication of whether CPOM was present in the bod bottle
* bottleOM: data table containing the total OM in each bod bottle, broken down by whether or not the bottle contained CPOM

####Data file name descriptions:
		
"CPOM": description of whether CPOM was added to the bod bottle
"tot.OM": total OM in bod bottle
"leaf.OM": mass of OM in CPOM
"sed.OM": mass of OM in 100 ml of sediment slurry