# Notes on the calculations for the Winklers and SOD measurements

## Date

* began 12 June 2014

* modified 16 June 2014

## Author

KF

## Purpose

This is a description of the calculations that we need to convert the winklers titration values into SOD meaurements.

## Winkler Calculations

## Calculations

    DO = {[(R - Rblk) Vstd * Nstd * E]/(Rstd - Rblk) (Vb - Vreg)} - DOreg

where:

* DO = dissolved oxygen in ml/L
* R = sample titration buret reading (ml)
* Rblk = difference between 1st and 2nd blank titration buret readings (ml)
* Rstd = standardization titration buret reading (ml)
* Vstd = volume of KIO3 standard (ml)
* Vb = sample volume (ml)
* Vreg = volume of sample displaced by reagents (ml)
* Nstd = normality of KIO3 standard (eq/L)
* E = 5,598 ml O2 / equivalent 
* DOreg = oxygen added with reagents (ml) = 0.018 ml/L O2 per 1 ml of MnCl


### R Code for Calculations

#### Vectors Needed

* Rblk = difference between 1st and 2nd blank titration buret readings (ml)
* Rstd = standardization titration buret reading (ml)
* Vstd = volume of KIO3 standard (ml)
* Vb = sample volume (ml)
* Vreg = volume of sample displaced by reagents (ml)
* Nstd = normality of KIO3 standard (eq/L)
* E = 5,598 ml O2 / equivalent 
* DOreg = oxygen added with reagents (ml) = 0.018 ml/L O2 per 1 ml of MnCl

    DO <- (((R - Rblk) Vstd * Nstd * E)/(Rstd - Rblk) (Vb - Vreg)) - DOreg

#### DO Measurement Calculation Test

Based on the data from the Water R on 10 June 2014

    std <- c(1.35, 1.27, 1.26)
    Rstd <- mean(std)
    blk <- c((1.26- 2.57), (1.28 - 2.55), (1.26 - 2.55))
    Rblk <- mean(blk)

    Vstd <- 0.2
    Vb <- 10 # this needs to be the actual vector
    Vreg <- (0.085 * 2) # each sample got 85 ul of MnCl & NaI
    Nstd <- 0.01
    E <- 5598
    DOreg <- 0.018 * 0.085

    R0 <- c(5.94, 6.60, 2.07, 2.17, 1.04, 1.97, 6.66, 5.99, 1.17, 7.85, 1.88, 2.90, 6.44, 2.35, 6.78, 7.79)
    R1 <- c(5.35, 6.18, 0.81, 0.21, 0.69, 0.60, 5.66, 5.30, 0.27, 5.71, 0.59, 0.38, 5.39, 0.50, 4.83, 6.50)

    DO.0 <- (((R0 - Rblk) * Vstd * Nstd * E)  / ((Rstd - Rblk) * (Vb - Vreg))) - DOreg
    DO.1 <- (((R1 - Rblk) * Vstd * Nstd * E)  / ((Rstd - Rblk) * (Vb - Vreg))) - DOreg

##### Conversion to mmol / L

To convert the DO concentration from ml/L to mmol/L I used the ideal gas law to determine the mols of O2 in the measured dissolved volume.

    DOconc.Tx <- (P * DOvol)/(R * T)

##### Variables Needed

* DOvol = the DO concentration measured from the winkler titration (ml/L)

* P = the atmospheric pressure (atm)

* T = the temperature (K)

* R = the ideal gas constant, which is 0.08206 (L * atm)/(mol * K)

## SOD Calculations

### Calculation

    SOD <- dO2 / (t * A)

    dO2 <- DOmmol.TF - DOmmol.T0

    DOmmol.T0 <- DOconc.T0 * BODwatervol

    DOmmol.TF <- DOconc.TF * BODwatervol

    DOconc.T0 <- DOconc.T0 * (1 - (Sampvol/BODwatervol)) + Replconc * (Replvol/BODwatervol)

#### Variables

* SOD = sediment oxygen demand (mmol/m2/d)

* dO2 = the difference in the mmol of DO in the BOD bottle between T0 and TF (mmol)

* t = the time elapsed between T0 and TF (d)

* A = the surface area of the sediments (m2)

* DOmmol.Tx = the mmol of DO in the BOD bottle at time step "x" (mmol)

* DOconc.Tx = the DO concentration in the BOD bottle at time step "x" (mmol/L)

* Sampvol = the volume of water removed during sampling

* Replconc = the DO concentration of the replacement water (mmol/L)

* Replvol = the volume of water added back to the BOD bottle before incubation (L)

* BODwatervol = the volume of the overlying water in the BOD bottle (L)
