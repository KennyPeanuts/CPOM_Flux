# Analysis of the  from the CPOM Flux Exp.

## Summer 2014

## Metadata

* Code created 23 March 2015 - KF
* Modified 31 March 2015 - KF - corrected SOD units to per h instead of per d
* Modified 7 May 2015 - KF - changed model designation of the repeated measures analysis
* Modified 8 May 2015 - KF - alterd the repeated measures analysis

## Purpose

This code is to analyze the effect of the nutrient and CPOM addition treatments on SOD in the CPOM Flux experiment.

## Code
### Import Data

Flux calculations can be found in `CPOM_Flux_Exp_SOD_flux_calc.md` in the `analysis` directory

    sod <- read.table("./data/CPOM_Flux_SOD.csv", header = T, sep = ",")
    # convert bod from `int` to `Factor`
    sod$bod <- as.factor(sod$bod)

### Summary Statistics

    summary(sod$SOD)

~~~~
in mmol O2 m2 d  


### Repeated Measures Analysis
#### Notes on repeated measures

I initially approached the problem using `aov`. I used [http://ww2.coastal.edu/kingw/statistics/R-tutorials/repeated.html](http://ww2.coastal.edu/kingw/statistics/R-tutorials/repeated.html) to evaluate the models. The is resulted in the following code and output:

    CPOM.aov <- (aov(sod.OM ~ CPOM * nutrient * days.elap + Error(bod/days.elap), data = sod))
    summary(CPOM.aov)

~~~~

> summary(CPOM.aov)

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
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Error: as.factor(bod):days.elap
                        Df Sum Sq Mean Sq F value Pr(>F)
CPOM                     1   5.32    5.32   0.245  0.632
days.elap                1  63.48   63.48   2.920  0.118
CPOM:nutrient            1  35.33   35.33   1.625  0.231
CPOM:days.elap           1  13.79   13.79   0.634  0.444
nutrient:days.elap       1   1.20    1.20   0.055  0.819
CPOM:nutrient:days.elap  1   3.21    3.21   0.148  0.709
Residuals               10 217.41   21.74               

Error: Within
              Df Sum Sq Mean Sq F value Pr(>F)
CPOM           1    8.9    8.92   0.146  0.704
CPOM:nutrient  1    0.0    0.01   0.000  0.989
Residuals     45 2747.2   61.05       


~~~~
  
This output seems to indicate that CPOM and nutrient are siginifcant but I am not comfortable with my interpretation of the output. I am not clear on how `Error: as.factor(bod)` and `Error: as.factor(bod):days.elap` differ.

While investigating this I kept coming across the fact that `aov` is not the best approach for analyzing data from a longitudinal study such as mine (e.g., [http://stackoverflow.com/a/5698400/686481](http://stackoverflow.com/a/5698400/686481)).

As a result I am investigating the use of linear mixed models for the analysis.  This is the same approach that I used for the Oxygen Availability test of SOD in the boondoggle study.

##### Linear Mixed models.

All of the notes below come draft chapters of from Douglas Bates book on the `lme4` package:

Chapter 1 - Introduction [http://lme4.r-forge.r-project.org/book/Ch1.pdf](http://lme4.r-forge.r-project.org/book/Ch1.pdf)

Chapter 4 - Repeated Measures [http://lme4.r-forge.r-project.org/book/Ch4.pdf](http://lme4.r-forge.r-project.org/book/Ch1.pdf)

Using the `lmer` function from the `lme4` package does not allow for the calculation of p-values for the estimations.

The `lmerTest` package contains the `lmer` function and does calculate the type III p-values using Satterwaite approximation for the df ([http://cran.r-project.org/web/packages/lmerTest//lmerTest.pdf](http://cran.r-project.org/web/packages/lmerTest//lmerTest.pdf).

                                                                                                                                         Using this package, I specify the model where the `bod` is the random subject variable.
                                                                                                                                         
    (fm <- lmer(sod.OM ~ 1 + days.elap * CPOM * nutrient + (1 + days.elap|bod), sod))


~~~~
  
> (fm <- lmer(sod.OM ~ 1 + days.elap * CPOM * nutrient + (1 + days.elap|bod), sod))
Linear mixed model fit by REML ['merModLmerTest']
Formula: sod.OM ~ 1 + days.elap * CPOM * nutrient + (1 + days.elap | bod)
   Data: sod
REML criterion at convergence: 521.6457
Random effects:
 Groups   Name        Std.Dev.  Corr
 bod      (Intercept) 0.000e+00     
          days.elap   6.218e-11  NaN
 Residual             7.177e+00     
Number of obs: 79, groups:  bod, 16
Fixed Effects:
                  (Intercept)                      days.elap                        CPOMyes  
                     15.85898                        0.02169                        8.28783  
                  nutrientyes              days.elap:CPOMyes          days.elap:nutrientyes  
                      3.22111                       -0.24410                        0.03422  
          CPOMyes:nutrientyes  days.elap:CPOMyes:nutrientyes  
                      0.86146                       -0.13663  
> 
  
~~~~
  
The significance is shown with 

    anova(fm)

~~~~
  
> anova(fm)
Analysis of Variance Table of type III  with  Satterthwaite 
approximation for degrees of freedom
                        Sum Sq Mean Sq NumDF DenDF F.value    Pr(>F)    
days.elap                66.09   66.09     1    71  1.2831 0.2611341    
CPOM                    651.66  651.66     1    71 12.6507 0.0006734 ***
nutrient                114.33  114.33     1    71  2.2195 0.1407093    
days.elap:CPOM          116.99  116.99     1    71  2.2712 0.1362374    
days.elap:nutrient        1.39    1.39     1    71  0.0271 0.8698197    
CPOM:nutrient             1.59    1.59     1    71  0.0309 0.8610156    
days.elap:CPOM:nutrient   5.59    5.59     1    71  0.1086 0.7427249    
---

~~~~
  
These results show that the only effect comes from CPOM.

### Plots

    # Plot that shows the CPOM and Nut treatment effects 
    plot(sod.OM ~ days.elap, data = sod, subset = CPOM == "yes" & nutrient == "yes", ylim = c(0, 50), pch = 16, xlab = "Days of Incubation", ylab = expression(paste("SOD (", mu, "mol (g OM)"^{-1}, " h"^{-1}, ")")))
    points(sod.OM ~ days.elap, data = sod, subset = CPOM == "yes" & nutrient == "no", pch = 1)
    points(sod.OM ~ days.elap, data = sod, subset = CPOM == "no" & nutrient == "yes", pch = 16, col = 4)
    points(sod.OM ~ days.elap, data = sod, subset = CPOM == "no" & nutrient == "no", pch = 1, col = 4)

    # Calculation of mean SOD by day and CPOM treatment for plot
    sod.mean.CPOM <- c(mean(sod$sod.OM[sod$days.elap == 0 & sod$CPOM == "yes"]), mean(sod$sod.OM[sod$days.elap == 2 & sod$CPOM == "yes"]), mean(sod$sod.OM[sod$days.elap == 7 & sod$CPOM == "yes"]), mean(sod$sod.OM[sod$days.elap == 14 & sod$CPOM == "yes"]), mean(sod$sod.OM[sod$days.elap == 21 & sod$CPOM == "yes"])) 
    sod.mean.ctl <- c(mean(sod$sod.OM[sod$days.elap == 0 & sod$CPOM == "no"]), mean(sod$sod.OM[sod$days.elap == 2 & sod$CPOM == "no"], na.rm = T), mean(sod$sod.OM[sod$days.elap == 7 & sod$CPOM == "no"]), mean(sod$sod.OM[sod$days.elap == 14 & sod$CPOM == "no"]), mean(sod$sod.OM[sod$days.elap == 21 & sod$CPOM == "no"])) 

    # Plot of OM normalized SOD by days of incubation (for ASB talk)
    par(las = 1, mar = c(5, 5, 2, 2))
    plot(sod.OM ~ days.elap, data = sod, subset = CPOM == "yes", ylim = c(0, 50), xlab = "Days of Incubation", ylab = expression(paste("SOD (", mu, "mol (g OM)"^{-1}, " h"^{-1}, ")")), pch = 1, col = "grey4", cex.axis = 1.5, cex.lab = 1.5, cex = 2)
    points(sod.mean.CPOM ~ unique(days.elap), data = sod, type = "b", pch = 16, col = "black", cex = 2.5)
    points(sod.OM ~ days.elap, data = sod, subset = CPOM == "no", pch = 2, col = "grey4", cex = 2)
    points(sod.mean.ctl ~ unique(days.elap), data = sod, type = "b", pch = 17, col = "black", cex = 2.5)
    legend(10, 50, c("Leaf Litter ", "No Leaf Litter "), pch = c(16, 17), cex = 1)
    dev.copy(jpeg, "./output/plots/SOD_OM_by_days.jpg")
    dev.off()

![Area normalized SOD by days elapsed](../output/plots/SOD_OM_by_days.jpeg)
