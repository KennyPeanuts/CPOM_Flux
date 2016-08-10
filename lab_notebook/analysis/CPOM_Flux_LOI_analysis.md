# Analysis of the Organic Matter of the sediments and leaves from the litter experiment 

## Summer 2014 

## Metadata

* Code created 9 Aug 2016

## Purpose

This code analyzes the LOI data from the Litter Experiment (CPOM Flux) and evaluates differences in the treatments

## Code
### Import Data

    loi.sed.init <- read.table("./data/CPOM_flux_LPP_sed_OM_inital_29May2014.txt", header = T)
    loi.sed.final <- read.table("./data/CPOM_flux_LPP_sed_OM_final_7jul2014.csv", header = T, sep = ",")
    loi.leaf.init <- read.table("./data/CPOM_flux_leaf_disk_OM_inital_30May2014.txt", header = T)
    loi.leaf.final <- read.table("./data/CPOM_flux_leaf_disk_OM_7jul2014.csv", header = T, sep = ",")
    treat <- read.table("./data/CPOM_Flux_treatments_summer2014.csv", header = T, sep = ",")

### Merge the treatments to the data

    loi.sed.final <- merge(loi.sed.final, treat, by = "bod")
    loi.leaf.final <- merge(loi.leaf.final, treat, by = "bod")

### Analyze treatment differences
#### Sediments

    tapply(loi.sed.final$prop.OM, loi.sed.final$litter, summary)

~~~~~
 The proportion of organic matter in the sediments by leaf litter presence at the end of the experiment

$LS
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.1264  0.1273  0.1280  0.1296  0.1322  0.1351 

$S
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.1268  0.1301  0.1316  0.1313  0.1332  0.1340 

~~~~
 
    tapply(loi.sed.final$prop.OM, loi.sed.final$nut, summary)

~~~~
 The proportion of organic matter in the sediments by nutrient addition at the end of the experiment

$AMB
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.1284  0.1311  0.1319  0.1319  0.1330  0.1351 

$NUT
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.1264  0.1270  0.1275  0.1290  0.1305  0.1340 

~~~~
 
### Percent Mass Loss of the Leaves
#### Calculate initial leaf AFDM
 
    mean(loi.leaf.init$AFDM)

~~~~
 The mean AFDM of a single leaf disc added to the litter exp (g)

[1] 0.0028

~~~~
 
#### Calculate mass loss
 
    mass.loss.leaf <- mean(loi.leaf.init$AFDM) - loi.leaf.final$AFDM
    summary(mass.loss.leaf)

~~~~
 AFDM lost from a single leaf disc during the litter exp (g)

 Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
0.0006000 0.0006875 0.0010210 0.0010180 0.0011370 0.0017890 

~~~~

#### Calculate Percent Mass Loss

     perc.mass.loss.leaf <- (mass.loss.leaf / mean(loi.leaf.init$AFDM)) * 100
     summary(perc.mass.loss.leaf)

~~~~
 Summary of the percent AFDM loss of a leaf in the litter exp

Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  21.43   24.55   36.46   36.37   40.63   63.89 

~~~~
 
    tapply(perc.mass.loss.leaf, loi.leaf.final$nut, summary)

~~~~
Percent AFDM lost by the leaves in the different nutrient treatments

$AMB
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  21.43   24.11   30.06   30.13   36.09   38.99 

$NUT
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  23.21   34.15   41.67   42.61   50.12   63.89 

~~~~

#### Test the nutrent effect
 
    anova(lm(perc.mass.loss.leaf ~ nut, data = loi.leaf.final))

~~~~~
 
Analysis of Variance Table

Response: perc.mass.loss.leaf
          Df  Sum Sq Mean Sq F value Pr(>F)
nut        1  311.26  311.26  1.7518 0.2338
Residuals  6 1066.09  177.68         

~~~~~
