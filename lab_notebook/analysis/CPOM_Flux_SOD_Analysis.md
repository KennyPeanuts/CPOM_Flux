# Analysis of the  from the CPOM Flux Exp.

## Summer 2014

## Metadata

* Code created 23 March 2015 - KF

* Modified

## Purpose

This code is to analyze the effect of the nutrient and CPOM addition treatments on SOD in the CPOM Flux experiment.

## Code
### Import Data

Flux calculations can be found in `CPOM_Flux_Exp_SOD_flux_calc.md` in the `analysis` directory

    sod <- read.table("./data/CPOM_Flux_SOD.csv", header = T, sep = ",")

### Repeated Measures Analysis

    summary(aov(sod.OM ~ CPOM * nutrient * days.elap + Error(as.factor(bod)), data = sod))

~~~~


Error: as.factor(bod)
                        Df Sum Sq Mean Sq F value   Pr(>F)    
CPOM                     1 1047.1  1047.1  28.446 0.000473 ***
nutrient                 1  218.0   218.0   5.924 0.037744 *  
days.elap                1   70.7    70.7   1.921 0.199096    
CPOM:nutrient            1    0.8     0.8   0.022 0.885383    
CPOM:days.elap           1   20.9    20.9   0.569 0.469941    
CPOM:nutrient:days.elap  1    0.0     0.0   0.001 0.982485    
Residuals                9  331.3    36.8                     
---

Error: Within
                        Df Sum Sq Mean Sq F value Pr(>F)
CPOM                     1    0.0    0.00   0.000  0.994
days.elap                1   63.0   63.02   1.194  0.279
CPOM:nutrient            1   20.9   20.90   0.396  0.532
CPOM:days.elap           1    1.3    1.35   0.026  0.874
nutrient:days.elap       1    1.1    1.09   0.021  0.886
CPOM:nutrient:days.elap  1    0.2    0.18   0.003  0.954
Residuals               57 3009.3   52.79               

~~~~

I am not sure how to interpret these results...

### Plots

    par(las = 1, cex = 2, mar = c(4, 4.5, 2, 2))
    plot(sod.OM ~ days.elap, data = sod, subset = CPOM == "yes" & nutrient == "yes", ylim = c(0, 50), pch = 16, xlab = "Days of Incubation", ylab = expression(paste("SOD (", mu, "mol (g OM)"^{-1}, " d"^{-1}, ")")))
    points(sod.OM ~ days.elap, data = sod, subset = CPOM == "yes" & nutrient == "no", pch = 1)
    points(sod.OM ~ days.elap, data = sod, subset = CPOM == "no" & nutrient == "yes", pch = 16, col = 4)
    points(sod.OM ~ days.elap, data = sod, subset = CPOM == "no" & nutrient == "no", pch = 1, col = 4)

    
