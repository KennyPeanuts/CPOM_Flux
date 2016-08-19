# Analysis of the SOD calcualtions from the Spring Leached Litter Exp 

## Spring 2016

## Metadata

* Code created 17 May 2016

* 16 Aug 2016 - KF - added calculations of DO concentration 

* 17 Aug 2016 - KF - converted DO to umol/L to match litter exp results

* 19 Aug 2016 - KF - normalized SOD by LOI and performed analysis

## Purpose

This code is to analyze the effect of the leached litter addition treatments on SOD. 

## Code
### Import Data

Flux calculations can be found in [leached_litter_Spring_sod_calc_11feb2016.md](https://github.com/KennyPeanuts/CPOM_Flux/blob/master/lab_notebook/analysis/leached_litter_Spring_sod_calc_11feb2016.md) and [leached_litter_Spring_sod_calc_18feb2016.md](https://github.com/KennyPeanuts/CPOM_Flux/blob/master/lab_notebook/analysis/leached_litter_Spring_sod_calc_18feb2016.md)

    sod_11feb <- read.table("./data/leached_litter_sp_sod_calculation_11feb2016.csv", header = T, sep = ",")
    sod_18feb <- read.table("./data/leached_litter_sp_sod_calculation_18feb2016.csv", header = T, sep = ",")

### Combine into a single dataset

    sod <- rbind(sod_11feb, sod_18feb)
    
#### Create a date and incubation day variable

    date <- c(rep("2016-02-11", 10), rep("2016-02-18", 10))
    # the incubation was begun on 9 Feb 2016
    days.elap <- c(rep(2, 10), rep(9, 10))

#### Create as single combined data.frame

    sod <- data.frame(date, days.elap, sod)

#### Normalize the SOD by organic matter content
##### Import LOI data

    loi <- read.table("./data/leached_litter_Spring_LOI_sp2016.csv", header = T, sep = ",")

##### Remove the initial data

    loi.final <- loi[loi$time == "final", ]

##### Calculate the total organic matter in the bottle

To to this I need to split out the leaf and sediment data and then merge it by BOD bottle

    leaf.AFDM <- loi.final$AFDM.leaf[loi.final$sample == "leaf"]
    leaf.bod <- loi.final$bod[loi.final$sample == "leaf"]

    leaf.OM <- data.frame(leaf.bod, leaf.AFDM)
    names(leaf.OM) <- c("bod", "leaf.AFDM")

    #data frame with a new column of the leaf AFDM
    loi.final.tot <- merge(loi.final, leaf.OM, by = "bod")
    loi.final.sed <- loi.final.tot[loi.final.tot$sample == "sed", ]
    
Now that I have a data frame (`loi.final.tot`) that has the leaf.AFDM and sediment AFDM in different columns, I can add them for the LS bottles

     AFDM.tot.LS <- loi.final.sed$AFDM.sample + loi.final.sed$leaf.AFDM

##### Create data frame of the total organic matter and the BOD number to merge with the SOD data

    LS.OM <- data.frame(loi.final.sed$bod, AFDM.tot.LS)
    names(LS.OM) <- c("bod", "AFDM.tot")

    S.OM <- data.frame(loi.final$bod[loi.final$treatment == "S"], loi.final$AFDM.sample[loi.final$treatment == "S"])
    names(S.OM) <- c("bod", "AFDM.tot")
    
    OM.tot <- rbind(S.OM, LS.OM)

The `OM.tot` data frame contains the total organic matter (leaf + sediment) (g AFDM) for each of the BOD bottles.

##### Merge the total OM to the SOD data

    sod.om <- merge(sod, OM.tot, by = "bod")

## Analysis

#### Convert DO from mmol/L to umol/L

    DO.T0.umol <- sod$DO.T0 * 1000

### Analyze DO concentrations

    tapply(DO.T0.umol, sod$days.elap, summary) 
    tapply(DO.T0.umol, sod$days.elap, sd)

~~~~
Dissolved oxygen in the bottles (umol /L) by days elapsed

$`2`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. SD
  225.3   226.4   227.1   234.4   241.0   265.7 13.698528 

$`9`
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. SD
  289.0   290.0   290.8   294.0   291.5   312.4 7.928689

~~~~

    tapply(DO.T0.umol, sod$treatment, summary) 
    tapply(DO.T0.umol, sod$treatment, sd)

~~~~
Dissolved oxygen in the bottles (umol/L) by treatment

$LS
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. SD
  225.3   231.9   267.8   265.8   290.4   312.4 34.65816

$S
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. SD
  226.1   226.7   277.8   262.6   290.8   291.7 31.93086

~~~~~
 
 
#### Plot of the DO concentration of the bottles by time and treatment
    
    par(las = 1, mar = c(6, 6, 3, 3))
    plot(DO.T0.umol ~ days.elap, data = sod, subset = treatment == "LS", ylim = c(0, 500), xlim = c(0, 21), xlab = "Days of Incubation", ylab = expression(paste("Dissolved Oxygen Conc. (", mu, "mol ",O[2], " L"^{-1}, ")")), pch = 4, cex.axis = 1.2, cex.lab = 1, cex = 1.5)
    points(DO.T0.umol ~ days.elap, data = sod, subset = treatment == "S", pch = 1, cex = 1.5)
    legend(12, 500, c("Leaf Litter", "No Leaf Litter"), pch = c(4, 1), cex = 1)
    dev.copy(jpeg, "./output/plots/leached_litter_DO_by_days.jpg")
    dev.off()

![Dissolved Oxygen by days elapsed](../output/plots/leached_litter_DO_by_days.jpg)

Dissolved Oxygen by days elapsed for bottles with and without leaf litter


### Area Normalized SOD

    
#### Plot Effect of Treatment on Area Norm SOD    
    par(las = 1, mar = c(6, 6, 3, 3))
    plot(SOD ~ days.elap, data = sod.om, subset = treatment == "LS", ylim = c(0, 2.5), xlim = c(0, 21), xlab = "Days of Incubation", ylab = expression(paste("SOD (mmol ", O[2], " m"^{-2}, " h"^{-1}, ")")), pch = 4, cex.axis = 1.2, cex.lab = 1.5, cex = 1.5)
    points(SOD ~ days.elap, data = sod.om, subset = treatment == "S", pch = 1, cex = 1.5)
    legend(12, 2.5, c("Leaf Litter", "No Leaf Litter"), pch = c(4, 1), cex = 1)
    dev.copy(jpeg, "./output/plots/leached_litter_SOD_by_days.jpg")
    dev.off()


![Area normalized SOD by days elapsed](../output/plots/leached_litter_SOD_by_days.jpg)

Area normalized SOD by days elapsed for bottles with and without leaf litter

### OM Normalized SOD

#### Normalize the change in O2 by AFDM

    dDO.OM <- sod.om$dDO / sod.om$AFDM.tot 

#### Normalize to h of incubation

    SOD.OM <- dDO.OM / sod.om$incubation.h #SOD in mmol O2 / (g AFDM) / h

#### Add to OM normalized data to sod data.frame

    sod.om <- data.frame(sod.om, SOD.OM)
