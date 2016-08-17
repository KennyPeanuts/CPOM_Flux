# Analysis of the SOD calcualtions from the Spring Leached Litter Exp 

## Spring 2016

## Metadata

* Code created 17 May 2016

* 16 Aug 2016 - KF - added calculations of DO concentration 

* 17 Aug 2016 - KF - converted DO to umol/L to match litter exp results

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

These data still need to be entered - KF - 16 Aug 2016
 
    #loi <- read.table("./data/

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
    plot(SOD ~ days.elap, data = sod, subset = treatment == "LS", ylim = c(0, 2.5), xlim = c(0, 21), xlab = "Days of Incubation", ylab = expression(paste("SOD (mmol ", O[2], " m"^{-2}, " h"^{-1}, ")")), pch = 4, cex.axis = 1.2, cex.lab = 1.5, cex = 1.5)
    points(SOD ~ days.elap, data = sod, subset = treatment == "S", pch = 1, cex = 1.5)
    legend(12, 2.5, c("Leaf Litter", "No Leaf Litter"), pch = c(4, 1), cex = 1)
    dev.copy(jpeg, "./output/plots/leached_litter_SOD_by_days.jpg")
    dev.off()


![Area normalized SOD by days elapsed](../output/plots/leached_litter_SOD_by_days.jpg)

Area normalized SOD by days elapsed for bottles with and without leaf litter

