# Analysis of the Areal Nutrient Flux from the CPOM Flux Exp.

## Summer 2014

## Metadata

* Code created 3 March 2015 - KF 

## Purpose

This code is to analyze the effect of the nutrient and CPOM addition treatments on the flux of NOx, NH4, and PO4 across the sediment water interface in the CPOM Flux experiment.

## Code
### Import Data

Flux calculations can be found in `CPOM_Flux_Nutrient_Flux_Calc.md` in the `analysis` directory.

    nut <- read.table("./data/CPOM_Flux_Nutrient_Flux_calc.csv", header = T, sep = ",")

### Summary Statistics

#### NOx
##### Total
    summary(nut$NOx)

~~~~

  Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-40.9500  -9.2510  -0.7163  11.2300   2.6620 181.1000 

~~~~

##### Ambient Nutrient Treatment

    summary(nut$NOx[nut$NUT == "0"])

~~~~

  Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-32.2900  -8.6660  -0.6576  12.5900   2.6620 179.9000 

~~~~

##### Enriched Nutrient Treatment

    summary(nut$NOx[nut$NUT == "N"])

~~~~

   Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-40.9500 -10.2700  -0.7163   9.8610   5.5520 181.1000 

~~~~

##### Ambient CPOM 

    summary(nut$NOx[nut$CPOM == "0"])

~~~~~

  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-40.950 -10.230  -1.571  23.100  12.090 181.100 

~~~~~

##### Added CPOM

     summary(nut$NOx[nut$CPOM == "C"])

~~~~

   Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-20.4000  -8.7810  -0.5527  -0.6438   1.1080  37.1600 

~~~~

#### NH3
##### Total
    summary(nut$NH3)

~~~~

  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-4.5650 -1.1510 -0.7626 -0.6896 -0.1123  7.4250 
~~~~

##### Ambient Nutrient Treatment

    summary(nut$NH3[nut$NUT == "0"])

~~~~

  Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-2.42500 -0.99630 -0.60300 -0.34380  0.01741  4.40800 

~~~~

##### Enriched Nutrient Treatment

    summary(nut$NH3[nut$NUT == "N"])

~~~~

  Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-4.5650 -1.3320 -0.8687 -1.0350 -0.2867  7.4250 
~~~~

##### Ambient CPOM 

    summary(nut$NH3[nut$CPOM == "0"])

~~~~~

 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
-4.5650 -1.5880 -0.9615 -0.9681 -0.2636  4.4080 

~~~~~

##### Added CPOM

     summary(nut$NH3[nut$CPOM == "C"])

~~~~

   Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-3.54900 -0.95060 -0.74780 -0.41120  0.04588  7.42500 

~~~~

#### P
##### Total
    summary(nut$P)

~~~~

     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-0.259700 -0.001705  0.077280  0.167300  0.304400  1.600000 

~~~~

##### Ambient Nutrient Treatment

    summary(nut$P[nut$NUT == "0"])

~~~~

 Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.18940  0.03151  0.09001  0.15530  0.28540  0.68210 

~~~~

##### Enriched Nutrient Treatment

    summary(nut$P[nut$NUT == "N"])

~~~~

  Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
-0.259700 -0.005352  0.063720  0.179400  0.304400  1.600000 

~~~~

##### Ambient CPOM 

    summary(nut$P[nut$CPOM == "0"])

~~~~~

  Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.16070  0.03645  0.15190  0.22260  0.37380  0.78710 

~~~~~

##### Added CPOM

     summary(nut$P[nut$CPOM == "C"])

~~~~

   Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
-0.25970 -0.01620  0.03673  0.11210  0.12760  1.60000 

~~~~

### Plots

    plot(NOx ~ days, data = nut, subset = CPOM == "C", col = 8)

    means.NOx.CPOM <- c(mean(nut$NOx[nut$CPOM == "C" & nut$days == 2]), mean(nut$NOx[nut$CPOM == "C" & nut$days == 7]), mean(nut$NOx[nut$CPOM == "C" & nut$days == 14]), mean(nut$NOx[nut$CPOM == "C" & nut$days == 21])) 
    means.NOx.NCPOM <- c(mean(nut$NOx[nut$CPOM == "0" & nut$days == 2]), mean(nut$NOx[nut$CPOM == "0" & nut$days == 7]), mean(nut$NOx[nut$CPOM == "0" & nut$days == 14]), mean(nut$NOx[nut$CPOM == "0" & nut$days == 21])) 

    points(NOx ~ days, data = nut, subset = CPOM == "0")


### Repeated Measures Analysis

  
