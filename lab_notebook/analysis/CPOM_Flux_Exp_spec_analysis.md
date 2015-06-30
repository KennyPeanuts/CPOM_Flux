# Analysis of the spec scan results from the CPOM Flux Experiment - Summer 2014

## Purpose

This code it to analyze the spec scan data from the treatments with and without CPOM and/or nutrients

## Load Data

    Eratio <- read.table("./data/CPOM_Flux_Eratio.csv", header = T, sep = ",")
    sratio <- read.table("./data/CPOM_Flux_sratio.csv", header = T, sep = ",")

## E-ratio data
### Statistical Summary

Summary of the E2:E3 in all of the samples on all days

    summary(Eratio$E2E3)

~~~~

Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.8743  3.1410  4.0500  4.8380  4.7340 21.1400 
  
~~~~

### Repeated Measures Analysis
  
Requires the `lmerTest` package

    library("lmerTest", lib.loc="~/Library/R/3.1/library")

#### Specify the formula

    E2E3.mod <- lmer(E2E3 ~ 1 + elapsed.d * CPOM * nutrient + (1 + elapsed.d|bod), Eratio)
    summary(E2E3.mod)

~~~~
  
Linear mixed model fit by REML t-tests use Satterthwaite approximations to degrees of
  freedom [merModLmerTest]
Formula: E2E3 ~ 1 + elapsed.d * CPOM * nutrient + (1 + elapsed.d | bod)
   Data: Eratio

REML criterion at convergence: 429.2

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-1.7965 -0.3316 -0.0962  0.2152  3.5484 

Random effects:
 Groups   Name        Variance Std.Dev. Corr 
 bod      (Intercept)  3.76091 1.939         
          elapsed.d    0.04042 0.201    -1.00
 Residual             11.47125 3.387         
Number of obs: 80, groups:  bod, 16

Fixed effects:
                              Estimate Std. Error       df t value Pr(>|t|)  
(Intercept)                    4.16773    1.49907 14.38000   2.780   0.0145 *
elapsed.d                     -0.01386    0.13991 12.05900  -0.099   0.9227  
CPOMyes                        2.89416    2.12001 14.38000   1.365   0.1932  
nutrientyes                    0.93125    2.12001 14.38000   0.439   0.6670  
elapsed.d:CPOMyes             -0.09627    0.19786 12.05900  -0.487   0.6353  
elapsed.d:nutrientyes         -0.10431    0.19786 12.05900  -0.527   0.6076  
CPOMyes:nutrientyes           -0.65706    2.99815 14.38000  -0.219   0.8296  
elapsed.d:CPOMyes:nutrientyes -0.03335    0.27982 12.05900  -0.119   0.9071  

Correlation of Fixed Effects:
            (Intr) elpsd. CPOMys ntrnty el.:CPOM elps.: CPOMy:
elapsed.d   -0.862                                            
CPOMyes     -0.707  0.610                                     
nutrientyes -0.707  0.610  0.500                              
elpsd.:CPOM  0.610 -0.707 -0.862 -0.431                       
elpsd.d:ntr  0.610 -0.707 -0.431 -0.862  0.500                
CPOMys:ntrn  0.500 -0.431 -0.707 -0.707  0.610    0.610       
elps.:CPOM: -0.431  0.500  0.610  0.610 -0.707   -0.707 -0.862

~~~~
  
#### Check Assumptions
  
Checking for homogeniety of variance with a plot of the residuals by the fitted

    plot(E2E3.mod)
    dev.copy(jpeg, "./output/plots/E2E3_resid_fitted.jpg")
    dev.off()

![residuals by fitted for the lmer model for the E2E3 data](../output/plots/E2E3_resid_fitted.jpg)

Overall the assumption seems to be reasonably met.

Checking for normality of the residuals with a qqnorm plot 

    qqnorm(resid(E2E3.mod))
    dev.copy(jpeg, "./output/plots/E2E3_qqnorm_resid.jpg")
    dev.off()

![qqnorm plot of the residuals](../output/plots/E2E3_qqnorm_resid.jpg)

This plot shows some departure from normality but I will take it.

#### Test for significance of Fixed Effects
  
    anova(E2E3.mod)

~~~~
  
Analysis of Variance Table of type III  with  Satterthwaite 
approximation for degrees of freedom
                        Sum Sq Mean Sq NumDF  DenDF F.value Pr(>F)
elapsed.d               35.167  35.167     1 12.059 3.06569 0.1053
CPOM                    33.601  33.601     1 14.380 2.92914 0.1085
nutrient                 1.854   1.854     1 14.380 0.16165 0.6936
elapsed.d:CPOM           7.476   7.476     1 12.059 0.65173 0.4351
elapsed.d:nutrient       8.578   8.578     1 12.059 0.74775 0.4041
CPOM:nutrient            0.551   0.551     1 14.380 0.04803 0.8296
elapsed.d:CPOM:nutrient  0.163   0.163     1 12.059 0.01421 0.9071

~~~~

#### Graphical Analysis

##### Plot of means and scatterplot

Plots of E2:E3

    E2E3.CPOM.mean <- as.numeric(tapply(Eratio$E2E3[Eratio$CPOM == "yes"], Eratio$elapsed.d[Eratio$CPOM == "yes"], mean))  
    E2E3.noCPOM.mean <- as.numeric(tapply(Eratio$E2E3[Eratio$CPOM == "no"], Eratio$elapsed.d[Eratio$CPOM == "no"], mean))
    
Create elapsed day vectors offset by 1

    elapsed.d.offset1 <- Eratio$elapsed.d + 1

     par(las = 1) 
     plot(E2E3 ~ elapsed.d, data = Eratio, subset = CPOM == "yes", pch = 1, xlim = c(0, 25), ylim = c(0, 20), xlab = "Days of Incubation", ylab = "DOM Quality (E2:E3)", cex = 1.1)
     points(E2E3 ~ elapsed.d.offset1, data = Eratio, subset = CPOM == "no", pch = 2, cex = 1.1)
     points(E2E3.CPOM.mean ~ unique(Eratio$elapsed.d), type = "b", pch = 16, cex = 1.6)
     points(E2E3.noCPOM.mean ~ unique(Eratio$elapsed.d), type = "b", pch = 17, cex = 1.6)
     legend(15, 15, c("Leaf Litter", "No Leaf Litter"), pch = c(16, 17))
     dev.copy(jpeg, "./output/plots/CPOM_Flux_E2E3_scatterplot.jpg")
     dev.off()
     
![Scatterplot and means of E2E3 by elapsed day and CPOM](../output/plots/CPOM_Flux_E2E3_scatterplot.jpg)

Plots of E4:E6

    E4E6.CPOM.mean <- as.numeric(tapply(Eratio$E4E6[Eratio$CPOM == "yes"], Eratio$elapsed.d[Eratio$CPOM == "yes"], mean))  
    E4E6.noCPOM.mean <- as.numeric(tapply(Eratio$E4E6[Eratio$CPOM == "no"], Eratio$elapsed.d[Eratio$CPOM == "no"], mean))
    
Create elapsed day vectors offset by 1

    elapsed.d.offset1 <- Eratio$elapsed.d + 1

     par(las = 1) 
     plot(E4E6 ~ elapsed.d, data = Eratio, subset = CPOM == "yes", pch = 1, xlim = c(0, 25), ylim = c(-50, 55), xlab = "Days of Incubation", ylab = "DOM Quality (E4:E6)", cex = 1.1)
     points(E4E6 ~ elapsed.d.offset1, data = Eratio, subset = CPOM == "no", pch = 2, cex = 1.1)
     # points(E4E6.CPOM.mean ~ unique(Eratio$elapsed.d), type = "b", pch = 16, cex = 1.6)
     # points(E4E6.noCPOM.mean ~ unique(Eratio$elapsed.d), type = "b", pch = 17, cex = 1.6)
     legend(15, 55, c("Leaf Litter", "No Leaf Litter"), pch = c(16, 17))
     dev.copy(jpeg, "./output/plots/CPOM_Flux_E4E6_scatterplot.jpg")
     dev.off()
     
![Scatterplot and means of E4E6 by elapsed day and CPOM](../output/plots/CPOM_Flux_E4E6_scatterplot.jpg)

##### Boxplots  

    par(mfcol = c(1, 2), mar = c(5, 5, 0, 0 ))
    plot(E2E3 ~ day, data = Eratio, subset = CPOM == "yes", ylim = c(0, 25), col = "white", axes = F, xlab = " ", ylab = "Labile Dissolved Organic Matter (E2:E3)")
    axis(1, at = c(1, 2, 3, 4, 5), labels = c("0", "2", "7", "14", "21"))
    axis(2,  las = 2)
    text(3, 17, "Leaf Litter")
    par(mar = c(5, 0, 0, 5))
    plot(E2E3 ~ day, data = Eratio, subset = CPOM == "no", ylim = c(0, 25), col = 8, axes = F, xlab = " ", ylab = " ")
    axis(1, at = c(1, 2, 3, 4, 5), labels = c("0", "2", "7", "14", "21") )
    #axis(2,  las = 2)
    text(3, 17, "No Leaf Litter")
    text(-2, -2, "Days Incubated")

    dev.copy(png, "./output/plots/cpom_flux_E2E3_by_day_CPOM.png")
    dev.off()

![E2E3 by day with CPOM](../output/plots/cpom_flux_E2E3_by_day_CPOM.png)

_E2E3 by day with CPOM_

## Sr data

### Statistical Summary

    summary(sratio$s.ratio)

~~~~

   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.8110  0.9718  1.0110  1.0270  1.0600  1.4790

~~~~

### Repeated Measures
 
 
    sratio.mod <- lmer(s.ratio ~ 1 + elapsed.d * CPOM * Nutrient + (1 + elapsed.d|bod), sratio)
    summary(sratio.mod)


~~~~
 
Linear mixed model fit by REML t-tests use Satterthwaite approximations to degrees of
  freedom [merModLmerTest]
Formula: s.ratio ~ 1 + elapsed.d * CPOM * Nutrient + (1 + elapsed.d |      bod)
   Data: sratio

REML criterion at convergence: -107

Scaled residuals: 
    Min      1Q  Median      3Q     Max 
-2.2150 -0.5347 -0.0998  0.5315  4.0020 

Random effects:
 Groups   Name        Variance  Std.Dev.  Corr
 bod      (Intercept) 0.000e+00 0.000e+00     
          elapsed.d   4.705e-19 6.859e-10  NaN
 Residual             7.563e-03 8.696e-02     
Number of obs: 80, groups:  bod, 16

Fixed effects:
                               Estimate Std. Error        df t value Pr(>|t|)    
(Intercept)                    0.977503   0.029354 72.000000  33.301  < 2e-16 ***
elapsed.d                      0.004667   0.002499 72.000000   1.868 0.065867 .  
CPOMyes                        0.153442   0.041513 72.000000   3.696 0.000424 ***
Nutrientyes                    0.011422   0.041513 72.000000   0.275 0.783996    
elapsed.d:CPOMyes             -0.012928   0.003534 72.000000  -3.659 0.000480 ***
elapsed.d:Nutrientyes         -0.003969   0.003534 72.000000  -1.123 0.265120    
CPOMyes:Nutrientyes           -0.057363   0.058708 72.000000  -0.977 0.331797    
elapsed.d:CPOMyes:Nutrientyes  0.006797   0.004998 72.000000   1.360 0.178063    

Correlation of Fixed Effects:
            (Intr) elpsd. CPOMys Ntrnty el.:CPOM elp.:N CPOM:N
elapsed.d   -0.749                                            
CPOMyes     -0.707  0.530                                     
Nutrientyes -0.707  0.530  0.500                              
elpsd.:CPOM  0.530 -0.707 -0.749 -0.375                       
elpsd.d:Ntr  0.530 -0.707 -0.375 -0.749  0.500                
CPOMys:Ntrn  0.500 -0.375 -0.707 -0.707  0.530    0.530       
elp.:CPOM:N -0.375  0.500  0.530  0.530 -0.707   -0.707 -0.749

~~~~
 
Test of the the significants of the fixed effects

    anova(sratio.mod)

~~~~
 
Analysis of Variance Table of type III  with  Satterthwaite 
approximation for degrees of freedom
                          Sum Sq  Mean Sq NumDF DenDF F.value    Pr(>F)    
elapsed.d               0.021009 0.021009     1    72  2.7780 0.0999123 .  
CPOM                    0.136613 0.136613     1    72 18.0644 6.306e-05 ***
Nutrient                0.002615 0.002615     1    72  0.3457 0.5583847    
elapsed.d:CPOM          0.110004 0.110004     1    72 14.5458 0.0002862 ***
elapsed.d:Nutrient      0.000394 0.000394     1    72  0.0521 0.8200693    
CPOM:Nutrient           0.007220 0.007220     1    72  0.9547 0.3317969    
elapsed.d:CPOM:Nutrient 0.013988 0.013988     1    72  1.8497 0.1780625  

~~~~

#### Check Assumptions
 
Checking for homogeneity of variance

    plot(sratio.mod, main = "sratio.mod")
    dev.copy(jpeg, "./output/plots/sratio_resid_fitted.jpg")
    dev.off()

![residuals vs fitted for sratio lme](../output/plots/sratio_resid_fitted.jpg)

Checking for normality of residuals with qqnorm plot

    qqnorm(resid(sratio.mod), main = "sratio.mod")
    dev.copy(jpeg, "./output/plots/sratio_qqnorm_resid.jpg")
    dev.off()
 
![qqnorm of the residuals of the sratio lme model](../output/plots/sratio_qqnorm_resid.jpg)


### Graphical Analysis

Create vector of means for Sr

    sratio.CPOM <- with(sratio, as.numeric(tapply(s.ratio[CPOM == "yes"], elapsed.d[CPOM == "yes"], mean)))
    sratio.noCPOM <- with(sratio, as.numeric(tapply(s.ratio[CPOM == "no"], elapsed.d[CPOM == "no"], mean)))

    elapsed.d.offsetpos <- sratio$elapsed.d + 0.25
    elapsed.d.offsetneg <- sratio$elapsed.d -0.25 

    par(las = 1, mar = c(5, 5, 2, 2))
    plot(s.ratio ~ elapsed.d.offsetneg, data = sratio, subset = CPOM == "yes", ylim = c(0.5, 1.5), xlim = c(-1, 22), pch = 1, xlab = "Days of Incubation", ylab = expression(paste("S"[R])), cex.lab = 1.5, cex.axis = 1.3, cex = 1.5)
    points(sratio.CPOM ~ c(0, 2, 7, 14, 21), type = "b", pch = 16, cex = 1.5)
    points(sratio.noCPOM ~ c(0, 2, 7, 14, 21), type = "b", pch = 17, cex = 1.5)
    points(s.ratio ~ elapsed.d.offsetpos, data = sratio, subset = CPOM == "no", pch = 2, cex = 1.5)
    legend(10, 1.5, c("Leaf Litter", "No Leaf Litter"), pch = c(16, 17), cex =1)
    dev.copy(jpeg, "./output/plots/sratio_by_days.jpg")
    dev.off()

![sratio by days and CPOM](../output/plots/sratio_by_days_jpg)


