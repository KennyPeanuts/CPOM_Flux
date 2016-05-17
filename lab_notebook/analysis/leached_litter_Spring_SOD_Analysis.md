# Analysis of the SOD calcualtions from the Spring Leached Litter Exp 

## Spring 2016

## Metadata

* Code created 17 May 2016 

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

## Analysis
    
    par(las = 1, mar = c(6, 6, 3, 3))
    plot(SOD ~ jitter(days.elap, 0.7), data = sod, subset = treatment == "LS", ylim = c(0, 2.5), xlim = c(0, 21), xlab = "Days of Incubation", ylab = expression(paste("SOD (m"^{-2}, " h"^{-1}, ")")), pch = 19, cex.axis = 1.5, cex.lab = 1.5, cex = 2)
    points(SOD ~ jitter(days.elap, 0.7), data = sod, subset = treatment == "S", pch = 1, cex = 2)
    legend(12, 2.5, c("Leaf Litter  ", "No Leaf Litter  "), pch = c(19, 1), cex = 1)
    dev.copy(jpeg, "./output/plots/leached_litter_SOD_by_days.jpg")
    dev.off()


![Area normalized SOD by days elapsed](../output/plots/leached_litter_SOD_by_days.jpg)
