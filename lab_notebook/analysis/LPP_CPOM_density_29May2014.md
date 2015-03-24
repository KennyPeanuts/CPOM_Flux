# CPOM Density Measurement From LPP for CPOM Flux Exp.

## Metadata

Collected by: KDP and KF

Collected on: Field samples collected on 29 May 2013

Affiliation: Longwood University      

Location: Lancer Park Pond

Description: 

* Replicate Ekman samples were collected from LPP and then passed through 250 um mesh in the field

* The material retained by the 250 um mesh was brought back to the lab un-preserved and passes through a 1 mm mesh. 

* All plant material that was retained by the 1 mm mesh was placed into a pre-weighed paper bag and dried at 50 dC

* The dried material was then homogenized with a mortar and pestle and placed into a per-weighed crucible and ashed at 550 dC for 4 h

Created: 5 June 2014

Modified: 6 June 2014, KF

### Variables:

#### Measured Variables

* rep = the replicate name

* depth = the depth that the ekman sample was taken (m)

* cruc = the crucible ID 

* cruc.mass = the mass of the empty crucible (g)

* cruc.CPOM = the mass of the crucible plus the dry CPOM (g)

* cruc.ash = the mass of the cruible plus the ash after 4 h at 550 dC (g)

#### Calculated Variables

* CPOM.ekman = the mass of the CPOM collected in the ekman (g)

* ash = the mass of the ashed CPOM per ekman (g)

* prop.OM = the proportion of OM in the CPOM

* CPOM = the mass of CPOM per m^2 (there are 0.0225 m^2 in an ekman)

* AFDM = the ash-free dry mass of the sample

## R Code

### Measured Variables
  
    rep <- LETTERS[1:4]
    depth <- c(1, 1, 0.4, 0.4)
    cruc <- c(21:24)
    cruc.mass <- c(30.9983, 26.9346, 28.8130, 29.3950)
    cruc.CPOM <- c(32.4642, 28.8457, 32.9767, 32.5144)
    cruc.ash <- c(31.1901, 27.1423, 29.4272, 29.8192)

### Calculated Variables

    CPOM.ekman <- cruc.CPOM - cruc.mass
    ash <- cruc.ash - cruc.mass
    prop.OM <- 1 - (ash / CPOM.ekman)
    CPOM <- CPOM.ekman / 0.0225
    AFDM <- CPOM * prop.OM

## Output

    cpom <- data.frame(rep, depth, cruc, cruc.mass, cruc.CPOM, cruc.ash, CPOM.ekman, ash, prop.OM, CPOM, AFDM)

    write.table(cpom, "./data/LPP_CPOM_density_for_CPOM_Flux_Exp_29May2014.txt", row.names = F, quote = F, sep = "\t")
