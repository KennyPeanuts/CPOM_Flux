# Analysis of the Nutrient Concentration from the CPOM Flux Exp.

## Summer 2014

## Metadata

* Code created 26 Jan 2016 - KF 

## Purpose

This code is to analyze the changes in nutrient concentration in the CPOM Flux Experiment 

## Code
### Import Data

    nut <- read.table("./data/CPOM_Flux_Nutrients.csv", header = T, sep = ",")

### Create Days Elapsed Variable

    days.elap <- c(rep(0, 2), rep(2, 18), rep(7, 18), rep(14, 18), rep(21, 18))

### Exploratory Plots 

    par(las = 1)
    plot(NOx ~ days.elap, data = nut, subset = BOD == "RW0", ylim = c(0, 4), ylab = "NOx concentration in the Repl. Water")
    points(NOx ~ days.elap, data = nut, subset = BOD == "RWN", pch = 19)
    legend(0, 4, c("No Nutrients Added", "Nutrients Added"), pch = c(1, 19))
    dev.copy(jpeg, "./output/plots/nox_repl_water.jpg")
    dev.off()
  
![NOx in replacemnt Water](../output/plots/nox_repl_water.jpg)

    plot(NH3 ~ days.elap, data = nut, subset = BOD == "RW0", ylim = c(0, 0.5), ylab = "NH3 concentration in the Repl. Water")
    points(NH3 ~ days.elap, data = nut, subset = BOD == "RWN", pch = 19)
    legend(0, 0.5, c("No Nutrients Added", "Nutrients Added"), pch = c(1, 19))
    dev.copy(jpeg, "./output/plots/nh3_repl_water.jpg")
    dev.off()
  
![NH3 in replacemnt Water](../output/plots/nh3_repl_water.jpg)
   
   plot(P ~ days.elap, data = nut, subset = BOD == "RW0", ylim = c(0, 0.05), ylab = "P concentration in the repl. water")
    points(P ~ days.elap, data = nut, subset = BOD == "RWN", pch = 19)
    legend(0, 0.05, c("No Nutrients Added", "Nutrients Added"), pch = c(1, 19))
    dev.copy(jpeg, "./output/plots/P_repl_water.jpg")
    dev.off()
  
![P in replacemnt Water](../output/plots/P_repl_water.jpg)

    plot((nut$NOx[nut$NUTS == "N" & nut$CPOM == "0"] - nut$NOx[nut$NUTS == "0" & nut$CPOM == "0"]) ~ days.elap[nut$NUTS == "N" & nut$CPOM == "0"], ylim = c(-0.2 , 0.6), pch = 1, xlab = "Days Elapsed", ylab = "Difference in NOx Conc. between Nutrient Enriched and Ctl Bottles")
    points((nut$NOx[nut$NUTS == "N" & nut$CPOM == "C"] - nut$NOx[nut$NUTS == "0" & nut$CPOM == "C"]) ~ days.elap[nut$NUTS == "N" & nut$CPOM == "C"], pch = 19)
    abline(h = 0)
    legend(0, 0.6, c("No Litter", "Litter Added"), pch = c(1, 19))
    dev.copy(jpeg, "./output/plots/nox_diff.jpg")
    dev.off()
  
![NOx diff between enriched](../output/plots/nox_diff.jpg)
    
    plot((nut$NH3[nut$NUTS == "N" & nut$CPOM == "0"] - nut$NH3[nut$NUTS == "0" & nut$CPOM == "0"]) ~ days.elap[nut$NUTS == "N" & nut$CPOM == "0"], ylim = c(-0.4 , 0.6), pch = 1, xlab = "Days Elapsed", ylab = "Difference in NH3 Conc. between Nutrient Enriched and Ctl Bottles")
    points((nut$NH3[nut$NUTS == "N" & nut$CPOM == "C"] - nut$NH3[nut$NUTS == "0" & nut$CPOM == "C"]) ~ days.elap[nut$NUTS == "N" & nut$CPOM == "C"], pch = 19)
abline(h = 0)
    legend(10, 0.6, c("No Litter", "Litter Added"), pch = c(1, 19))
    dev.copy(jpeg, "./output/plots/nh3_diff.jpg")
    dev.off()
  
![NH3 diff between enriched](../output/plots/nh3_diff.jpg)
    
    plot((nut$P[nut$NUTS == "N" & nut$CPOM == "0"] - nut$P[nut$NUTS == "0" & nut$CPOM == "0"]) ~ days.elap[nut$NUTS == "N" & nut$CPOM == "0"], ylim = c(-0.1 , 0.1), pch = 1, xlab = "Days Elapsed", ylab = "Difference in P Conc. between Nutrient Enriched and Ctl Bottles")
    points((nut$P[nut$NUTS == "N" & nut$CPOM == "C"] - nut$P[nut$NUTS == "0" & nut$CPOM == "C"]) ~ days.elap[nut$NUTS == "N" & nut$CPOM == "C"], pch = 19)
abline(h = 0)
    legend(0, 0.1, c("No Litter", "Litter Added"), pch = c(1, 19))
    dev.copy(jpeg, "./output/plots/p_repl_water.jpg")
    dev.off()
  
![P diff between enriched](../output/plots/p_repl_water.jpg)

    
    plot(NOx ~ jitter(days.elap, 2), data = nut)
    plot(NH3 ~ jitter(days.elap, 2), data = nut)    
    plot(P ~ jitter(days.elap, 2), data = nut)

