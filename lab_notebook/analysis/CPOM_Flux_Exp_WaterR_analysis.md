# Analysis of the SOD results from the CPOM Flux Experiment - Summer 2014

## Purpose

This code it to analyze the water R data from the treatments with and without CPOM and/or nutrients

## Import data

    wR11 <- read.table("./data/waterR_calculation_11jun2014.csv", header = T, sep = ",")
    wR13 <- read.table("./data/waterR_calculation_13jun2014.csv", header = T, sep = ",")
    wR18 <- read.table("./data/waterR_calculation_18jun2014.csv", header = T, sep = ",")
    wR25 <- read.table("./data/waterR_calculation_25jun2014.csv", header = T, sep = ",")


## Data Analysis

### Get average from all dates

    sum.wR <- wR11$waterR + wR13$waterR + wR18$waterR + wR25$waterR
    wR.avg <- sum.wR / 4

### Analyze Average R wrt treatments

    anova(lm(wR.avg ~ CPOM * nutrient, data = wR11))

#### Output

~~~~

Analysis of Variance Table

Response: wR.avg
              Df     Sum Sq   Mean Sq F value    Pr(>F)    
CPOM           1 5.4150e-06 5.415e-06 23.0799 0.0005497 ***
nutrient       1 5.3920e-07 5.392e-07  2.2982 0.1577248    
CPOM:nutrient  1 9.2000e-09 9.200e-09  0.0391 0.8468383    
Residuals     11 2.5808e-06 2.346e-07                      


~~~~

    plot(wR.avg ~ CPOM, data = wR11, col = "light green", ylab = expression(paste("R (mmol L"^{-1}, " h"^{-1}, ")")))
    abline(h = 0, lty = 2)
    dev.copy(png, "./output/plots/CPOM_Flux_WaterR_by_CPOM_all.png")
    dev.off()

![Water R by CPOM averaged across all dates](./output/plots/CPOM_Flux_WaterR_by_CPOM_all.png)

_Water R by CPOM averaged across all dates_

Interestingly the no-CPOM treatments have a negative R, suggesting that they are accumulating oxygen during the incubation.  I do not know how this would be possible since they were incubated in the dark.


    plot(wR.avg ~ nutrient, data = wR11, col = "orange", ylab = expression(paste("R (mmol L"^{-1}, " h"^{-1}, ")")))
    abline(h = 0, lty = 2)
    dev.copy(png, "./output/plots/CPOM_Flux_WaterR_by_nutrient_all.png")
    dev.off()

![Water R by CPOM averaged across all dates](./output/plots/CPOM_Flux_WaterR_by_nutrient_all.png)

_Water R by Nutrients averaged across all dates_

