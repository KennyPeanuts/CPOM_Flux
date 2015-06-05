# Analysis of the organic matter content (sediment + leaf discs) in the CPOM Flux Experiment. 

## Metadata

Code created: 3 June 2015 

Modified: 

* 4 June 2015 - KF - calculated the amount of OM in the BOD bottles

* 5 June 2015 - KF - calculated the amount of CPOM AFDM in the LPP Ekman samples


## Purpose

This code complies and analyzes all of the data on the amount of organic matter in the BOD bottles in the CPOM Flux Experiment.

## Import data

    om <- read.delim("./data/cpom_flux_bod_om_initial_raw.csv", header = T, sep = ",")

## Create Calculated Variables

Calculate the mass of the CPOM in the lake

     cpom <- om$bag.cpom - om$bag.mass

Calculate the dry sediment mass

     sed <- om$cruc.dry.sed - om$cruc.mass

Calculate the ash mass

     ash <- om$cruc.ash - om$cruc.mass

Calculate the proportion of OM

    prop.OM <- (sed - ash) / sed

Calculate the prop water in the lake sediments

    prop.water <- ((om$cruc.wet.sed - om$cruc.mass) - sed) / (om$cruc.wet.sed - om$cruc.mass)

## Add the calculated variables to the data.frame

    om <- data.frame(om, cpom, sed, ash, prop.OM, prop.water)

    write.table(om, "./data/CPOM_Flux_BOD_OM_initial.csv", quote = F, row.names = F, sep = ",")

** Begin here for reanalysis **

    om <- read.table("./data/CPOM_Flux_BOD_OM_initial.csv", header = T, sep = ",")
    
## Determine the mass of organic matter in the BOD bottles

The BOD bottles were filled with 100 ml of slurry. This slurry has a mean water content of

     mean(om$prop.water[om$om == "sed"], na.rm = T)

~~~~

[1] 0.7793371

~~~~

to calculate the dry mass of the sediment, we calculate the mean dry mass of 10 ml of sediment (the amount of sediment added to the crucible) * 10

    mean(om$sed[om$om == "sed"], na.rm = T) * 10

~~~~

[1] 25.3492 g

~~~~

this agrees well with the estimation we get with the wet mass and the proportion of water

    mean(om$cruc.wet.sed[om$om == "sed"] - om$cruc.mass[om$om == "sed"]) * (1 - mean(om$prop.water[om$om == "sed"])) * 10

~~~~

[1] 25.34913 g

~~~~

To calculate the mass of the organic matter in the bottles we multiply the mass of sediment by the proportion of organic matter. Note I did this on each sample and then took the mean.

     
    summary((om$sed[om$om == "sed"] * 10) * om$prop.OM[om$om == "sed"])

~~~~

in grams

 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  3.156   3.226   3.268   3.250   3.268   3.330

~~~~

So the median OM mass in the BOD bottles was `3.268 g` without the added leaf litter.

Each bottle in the CPOM treatment received 20 leaf discs, the mean dry mass of a leaf disc is

    mean(om$sed[om$om == "leaf.disc"], na.rm = T)

~~~~

[1] 0.00316 g

~~~~

the range of organic matter mass of the leaf discs is

    summary(om$sed[om$om == "leaf.disc"] * om$prop.OM[om$om == "leaf.disc"])

~~~~

in grams

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.0020  0.0021  0.0023  0.0028  0.0036  0.0040

~~~~

So the estimated range of leaf OM added to each bottle was

    min(om$sed[om$om == "leaf.disc"] * om$prop.OM[om$om == "leaf.disc"]) * 20

~~~~

[1] 0.04 g

~~~~

to

    max(om$sed[om$om == "leaf.disc"] * om$prop.OM[om$om == "leaf.disc"]) * 20

~~~~

[1] 0.08 g

~~~~

This range means that we only increased the OM mass of the bottles by 

     (0.04 / (3.268 + 0.04)) * 100

~~~~

[1] 1.20919 %

~~~~

to

     (0.08 / (3.268 + 0.04)) * 100

~~~~

[1] 2.41838 %

~~~~


## Determine how the amount of OM in the bottles compares to the amount in the lake

The surface area of the bottles is `0.00353 m2` based on the calculations in `CPOM_flux_BOD_OM_input_calc_6Jun2014.md` in the `analysis` folder


This means that there are

     3.268 / 0.00353 

~~~~

[1] 925.779 g/m2 organic matter in the bottles without CPOM

~~~~

and between

     0.04 / 0.00353 

~~~~

[1] 11.33144 g/m2 of OM added in the CPOM treatments based on the min

~~~~

    0.08 / 0.00353 

~~~~

22.66289 g/m2 of OM added in the CPOM treatments based on the max

~~~~

## Calculation of the Density of CPOM OM in LPP

The dry mass of the CPOM in the sediments from LPP are the mass of the leaf litter collected by the Ekmans.

    om$cpom[om$om == "cpom"]
~~~~
in grams

[1] 1.4834 1.9426 4.3025 3.2010
~~~~

Note that the 2 samples with the greater CPOM mass came from 0.4 m water depth and the 2 samples with the lesser CPOM mass came from 1 m water dept (`metadata/LPP_CPOM_density_29May2014.md`).

To convert these to density per square meter we divided each measurement by the square area of the Ekman, which is 0.0225 m2. 

    om$cpom[om$om == "cpom"] / 0.0225

~~~~

CPOM g/m2

[1]  65.92889  86.33778 191.22222 142.26667

~~~~

Converting this to OM with the perc.OM calculated from the LOI

    (om$cpom[om$om == "cpom"] / 0.0225) * om$prop.OM[om$om == "cpom"]

~~~~
  
CPOM OM in g/m2

[1]  57.26220  76.95451 163.01445 122.92015

~~~~
  
This means that the sediments of the lake had between `57.26` and `163.01` g CPOM AFDM per square meter.

### Comparison of the BOD Bottles to LPP

Based on these calculations the BOD bottles contained at most `40%` of the CPOM AFDM of the actual lake.

    22.66 / 57.26 # the max estimate of the CPOM in the bottles and the min estimate of CPOM in LPP.

This is likely reasonable because some of the CPOM collected with the Ekman was buried in the sediment.  We do not have a good estimate of the vertical distribution of the CPOM in the lake but it seems reasonable to assume that by the summer less than half of it would remain on the surface.

