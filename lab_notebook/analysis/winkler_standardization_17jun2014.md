# Calculation of standardization for Winkler Titration

## Date of Run 

17 June 2014

## Metadata

### Collected by:

KP

### Created on: 20 June 2014

### Modified

### Affiliation

Longwood University

### Description 

The code for the calculation of the standardization variables for the winkler titrations.

## Variable Descriptions

* stds = the ml of titrant used to titrate the blank (ml)

* blank.first = the ml of titrant used to titrate the first blank reading (ml)

* blank.second = the total titrant volume needed to titrate the blank after the second addition of the KIO3 (ml)

* Vstd = the volume of the KIO3 standard used (ml)

* MnCl.vol = the volume of the MnCl2 * 4H20 reagent (ml)

* NaI.vol = the volume of the NaI - NaOH reagent (ml)

* Nstd = the normality of the KIO3 standard

* E = the ml of oxygen per equivilent, which is a constant

* Rstd = the mean volume needed to titrate the standards (ml)

* blank.second.vol = the additional titrant volume needed to titrate the second blank after the second addition of the KIO3 (ml)

* Rblk = the mean difference between the initial and additional blank titrant needed to titrate the blank sample (ml)

* Vreg = the total reagent volume added to the fixed sample (ml)

* MnCl.DO = the ml of oxygen per ml of MnCl reagent (ml/ml)

* DOreg = the ml of oxygen added with the MnCl reagent (ml)

## R Code

### Data entry
    
    # insert actual titration values
    stds <- c(1.29, 1.34, 1.25) 
    blank.first <- c(1.25, 1.26, 1.27)
    blank.second <- c(2.53, 2.51, 2.58)
    Vstd <- 0.2
    MnCl.vol <- 0.085
    NaI.vol <- 0.085
    Nstd <- 0.01
    E <- 5598
    MnCl.DO <- 0.018

### Calculations

    Rstd <- mean(stds)
    blank.second.vol <- blank.second - blank.first
    Rblk <- mean(blank.first - blank.second.vol)
    Vreg <- sum(MnCl.vol, NaI.vol)
    DOreg <- MnCl.DO * MnCl.vol

## Output

    std <- data.frame(Rstd, Rblk, Vstd, Nstd, E, Vreg, DOreg)
    
    # insert date of run into file name
    write.table(std, file = "./data/winkler_standardization_17jun2014.csv", quote = F, row.names = F, sep = ",")



