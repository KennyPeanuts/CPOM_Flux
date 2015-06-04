# Analysis of the organic matter content (sediment + leaf discs) in the CPOM Flux Experiment. 

## Metadata

Code created: 3 June 2015 

Modified: 

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

The surface area of the bottles is

BOD bottle radius = 3 cm

    (pi * 3^2) / 10000 # using 10000 cm^2 per m^2

~~~~

[1] 0.002827433 m^2

~~~~

This means that there are

     3.268 / 0.00282

~~~~

[1] 1158.865 g/m2 organic matter in the bottles without CPOM

~~~~

and between

     0.04 / 0.00282

~~~~

[1] 14.1844 g of OM added in the CPOM treatments based on the min

~~~~

    0.08 / 0.00282

~~~~

[1] 28.36879 g of OM added in the CPOM treatments based on the max

~~~~


