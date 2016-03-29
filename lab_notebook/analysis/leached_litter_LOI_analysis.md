# Analysis of the LOI from the leached litter exp. 

## Fall 2015

## Metadata

* Code created 2 Feb 2016 - KF

## Purpose

This code analyzes the LOI data from the Leached Litter experiment and evaluates differences in the treatments

## Code
### Import Data

    loi <- read.table("./data/leached_litter_LOI_5nov2015.csv", header = T, sep = ",")


### Compare Mass Loss
    
    initial.leaf.mean <- (mean(loi$AFDM.leaf[loi$treat == "PRE"]))
    
    mass.loss <- initial.leaf.mean - loi$AFDM.leaf[loi$sample == "leaf"]
    perc.mass.rem <- (1 - (mass.loss / initial.leaf.mean)) * 100
    
    #remove the PRE samples
    mass.loss <- mass.loss[1:8]
    perc.mass.rem <- perc.mass.rem[1:8]

#### Summary by Treatment

    tapply(mass.loss, loi$treat[loi$sample == "leaf" & loi$treat != "PRE"], summary)

~~~~
# mass loss (g)

$L
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
0.0004200 0.0004325 0.0006408 0.0006450 0.0008533 0.0008783 

$LS
     Min.   1st Qu.    Median      Mean   3rd Qu.      Max. 
0.0007867 0.0008637 0.0010060 0.0009832 0.0011260 0.0011340 


~~~~

    tapply(perc.mass.rem, loi$treat[loi$sample == "leaf" & loi$treat != "PRE"], summary)
 
~~~~
# Percent Mass Remaining

$L
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  59.05   60.22   70.12   69.93   79.84   80.42 

$LS
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
  47.14   47.53   53.10   54.16   59.73   63.33 
~~~~

### Test Treatment Effect

    # Create treatment vector
    treatment <- loi$treat[loi$sample == "leaf" & loi$treat != "PRE"]    
    treatment <- as.numeric(treatment)
    
    anova(lm(perc.mass.rem ~ as.factor(treatment)))
     
     
~~~~
      
Analysis of Variance Table

Response: perc.mass.rem
                     Df Sum Sq Mean Sq F value  Pr(>F)  
as.factor(treatment)  1 497.17  497.17  4.9357 0.06804 .
Residuals             6 604.38  100.73

~~~~

#### Plots

    par(las = 1, mar = c(5, 5, 5, 5), lwd = 2)
    plot(perc.mass.rem ~ jitter(treatment, 0.5), ylim = c(0, 100), xlim = c(0.5, 2.5), axes = F, xlab = " ", ylab = "Percent Mass Remaining", cex.lab = 1.5, pch = 19)
    axis(2, cex.axis = 1.2)
    axis(1, c("No Sediment", "Sediment"), at = c(1, 2), cex.axis = 1.5)
    box(lwd = 5)
    text(1, mean(perc.mass.rem[treatment == 1]), "*", cex = 2, col = "red")
    text(2, mean(perc.mass.rem[treatment == 2]), "*", cex = 2, col = "red")
    dev.copy(jpeg, "./output/plots/perc_mass_rem_by_treatment.jpg")
    dev.off()

![Plot of percent leaf mass remaining by sediment presence](../output/plots/perc_mass_rem_by_treatment.jpg)

FIGURE: Plot of the percent leaf mass remaining by the presence of sediment in the bottles in the Leached Litter Experiment. Each point represents the average mass loss of a single leaf estimated from the change in mass of all of the leaves in the bottle. The red star indicates the mean.
