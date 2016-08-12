# Calculation of standardization for Winkler Titration

## Date of Run
 
25 Sept 2015

## Metadata

### Collected by:

KF

### Created on:

15 Oct 2015

### Modified

### Affiliation

Longwood University

### Description 

The code for the calculation of the standardization variables for the winkler titrations.

## Variable Descriptions

* std.begin.buret = the begining reading on the buret (ml)

* std.end.buret = the end reading on the buret (ml)

* stds = the ml of titrant used to titrate the blank (ml)

* blank.begin1 = the reading on the buret at the beginning of the first blank reading (ml)

* blank.end1 = the reading on the buret at the end of the first blank reading (ml)

* blank.begin2 = the reading on the buret at the beginning of the first blank reading (ml)

* blank.end2 = the reading on the buret at the end of the first blank reading (ml)

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
    
    std.begin.buret <- c(0.00, 0.15, 0.35)
    std.end.buret <- c(0.15, 0.35, 0.525)
    blank.begin1 <- c(0.525, 0.90, 1.20)
    blank.end1 <- c(0.65, 1.05, 1.35)
    blank.begin2 <- c(0.65, 1.05, 1.35)
    blank.end2 <- c(0.90, 1.20, 1.50)
    Vstd <- 0.2
    MnCl.vol <- 0.085
    NaI.vol <- 0.085
    Nstd <- 0.01
    E <- 5598
    MnCl.DO <- 0.018


### Calculations

    stds <- std.end.buret - std.begin.buret 
    blank.first <- blank.end1 - blank.begin1
    blank.second <- blank.first + (blank.end2 - blank.begin2) 
    Rstd <- mean(stds)
    blank.second.vol <- blank.second - blank.first
    Rblk <- mean(blank.first - blank.second.vol)
    Vreg <- sum(MnCl.vol, NaI.vol)
    DOreg <- MnCl.DO * MnCl.vol

## Output

    std <- data.frame(Rstd, Rblk, Vstd, Nstd, E, Vreg, DOreg)
    
    write.table(std, file = "./data/winkler_standardization_25sept2015.csv", quote = F, row.names = F, sep = ",")



