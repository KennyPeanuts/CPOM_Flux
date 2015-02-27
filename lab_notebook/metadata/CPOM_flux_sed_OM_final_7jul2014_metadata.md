# Final Determination of the OM content of the the sediments for the CPOM flux exp.

## Metadata

Collected by: KDP and KF

Collected on: 30 June 2014

Affiliation: Longwood University

Location: Lancer Park Pond

Modified:

* 13 Jan 2014 KF - corrected the methods and variable descriptions to indicate the volume of sediment used.

Description: 

* Sediments were collected from LPP with an Ekman and then sieved through a 250 um mesh to remove all macroinvertebrates and CPOM

* The sediments were placed into BOD bottles on 9 June 2014 until 30 June 2014 in the dark with pond water and the applicable treatment conditions.

* At the conclusion of the experiment the water was siphoned off and a 1 X 0.8 cm core was collected from the center of the bottle. The core volume is `pi * (0.4^2) * 1 = 0.5 cm3`.

* The sediment core was placed into a preweighed crucible and then dried at 50 dC and ashed at 550 dC

Created: 7 July 2014

Modified:

### Variables

#### Measured Variables

* bod = the ID number of the BOD bottle

* cruc = the crucible identiying number

* cruc.mass = the mass of the empty crucible (g)

* cruc.dry = the mass of the crucuble plus the sediments after drying at 50 dC (g)

* cruc.ash = the mass of the crucible plus the ash after 4 h at 550 dC (g)

#### Calculated Variables

* sed.dry = the dry mass of the 0.5 ml sediment core (g)

* sed.ash = the mass of the ash after 4 h at 550 dC (g)

* prop.OM = the proportion of orgainic matter in the sediment

* AFDM.core = the ash-free dry mass of the sediment 0.5 ml core(g)


## R Code

    bod <- c(1:16)
    cruc <- c(1:16)
    cruc.mass <- c(29.7394, 26.6532, 28.0768, 27.4876, 30.3804, 31.5151, 28.1983, 28.9673, 27.0798, 29.7509, 26.5938, 28.1251, 29.7268, 28.2186, 26.9912, 28.8726)
    cruc.dry <- c(29.8904, 26.8312, 28.2778, 27.7457, 30.5445, 31.7115, 28.3639, 29.1969, 27.2528, 29.9865, 26.7734, 28.2848, 29.8943, 28.3969, 27.1671, 29.0607)
    cruc.ash <- c(29.8700, 26.8075, 28.2514, 27.7129, 30.5226, 31.6854, 28.3429, 29.1670,27.2300, 29.9565, 26.7507, 28.2643, 29.8722, 28.3730, 27.1443, 29.0367)

### Calculated Variables

    sed.dry <- cruc.dry - cruc.mass
    sed.ash <- cruc.ash - cruc.mass
    prop.OM <- 1 - (sed.ash / sed.dry)
    AFDM.core <- sed.dry * prop.OM

    sedOM <- data.frame(bod, cruc, cruc.mass, cruc.dry, cruc.ash, sed.dry, sed.ash, prop.OM, AFDM.core)

## Output

    write.table(sedOM, "./data/CPOM_flux_LPP_sed_OM_final_7jul2014.csv", row.names = F, sep = ",", quote = F) 
