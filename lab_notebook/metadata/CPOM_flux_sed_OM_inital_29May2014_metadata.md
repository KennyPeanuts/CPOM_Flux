# Initil Determination of the OM content of the the sediments for the CPOM flux exp.

## Metadata

Collected by: KDP and KF

Collected on: 29 May - 3 June 2014

Affiliation: Longwood University

Location: Lancer Park Pond

Description: 

* Sediments were collected from LPP with an Ekman and then sieved through a 250 um mesh to remove all macroinvertebrates and CPOM

* The sediments were then allowd to settle ovenight and the overlying water was siphoned off

* The remaining slurry was homogenized and 10 ml was place into a pre-weighed crucible

* The sediments were then dried at 50 dC and ashed at 550 dC

Created: 5 June 2014

Modified:

### Variables

#### Measured Variables

* rep = the replicate identifier

* cruc = the crucible identiying number

* cruc.mass = the mass of the empty crucible (g)

* cruc.wet = the mass of the crucible plus the wet sediments (g)

* cruc.dry = the mass of the crucuble plus the sediments after drying at 50 dC (g)

* cruc.ash = the mass of the crucible plus the ash after 4 h at 550 dC (g)

#### Calculated Variables

* sed.wet = 

## R Code

    rep <- c(1:5)
    cruc <- c(1:5)
    cruc.mass <- c(29.7378, 26.6517, 28.0753, 27.4867, 30.3799)
    cruc.wet <- c(41.0326, 38.0633, 39.5898, 39.0056, 42.0787)
    cruc.dry <- c(32.2242, 29.1841, 30.6054, 30.0275, 32.9646)
    cruc.ash <- c(31.9088, 28.8573, 30.2828, 29.7007, 32.6316)

### Calculated Variables

    sed.wet <- cruc.wet - cruc.mass
    sed.dry <- cruc.dry - cruc.mass
    sed.ash <- cruc.ash - cruc.mass
    prop.water <- 1 - (sed.dry / sed.wet)
    prop.OM <- 1 - (sed.ash / sed.dry)

    sedOM <- data.frame(rep, cruc, cruc.mass, cruc.wet, cruc.dry, cruc.ash, sed.wet, sed.dry, sed.ash, prop.water, prop.OM)

## Output

    write.table(sedOM, "./data/CPOM_flux_LPP_sed_OM_inital_29May2014.txt", row.names = F, sep = "\t", quote = F) 
